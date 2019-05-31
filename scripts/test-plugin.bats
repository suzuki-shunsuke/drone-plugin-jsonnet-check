#!/usr/bin/env bats

@test "success" {
  run docker run --rm \
    -e PLUGIN_SOURCE=drone.jsonnet \
    -e PLUGIN_TARGET=drone.yml \
    -e PLUGIN_FORMAT=true \
    -v $(pwd)/test-data:/drone/src \
    -w /drone/src \
    suzukishunsuke/jsonnet-check:local
  echo "$output" >&3
  [ "$status" -eq 0 ]
}

@test ".drone.jsonnet isn't found" {
  run docker run --rm \
    -e PLUGIN_TARGET=drone.yml \
    -v $(pwd)/test-data:/drone/src \
    -w /drone/src \
    suzukishunsuke/jsonnet-check:local
  echo "$output" >&3
  [ "$status" -eq 0 ]
}

@test ".drone.yml isn't found" {
  run docker run --rm \
    -e PLUGIN_SOURCE=drone.jsonnet \
    -v $(pwd)/test-data:/drone/src \
    -w /drone/src \
    suzukishunsuke/jsonnet-check:local
  echo "$output" >&3
  [ "$status" -ne 0 ]
}

@test "case: there is diff" {
  run docker run --rm \
    -e PLUGIN_SOURCE=drone.jsonnet \
    -e PLUGIN_TARGET=drone-failure.yml \
    -e PLUGIN_FORMAT=true \
    -v $(pwd)/test-data:/drone/src \
    -w /drone/src \
    suzukishunsuke/jsonnet-check:local
  echo "$output"
  echo "$output" >&3
  [ "$status" -ne 0 ]
}
