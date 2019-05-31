#!/usr/bin/env bats

@test "success" {
  run eval "PLUGIN_SOURCE=test-data/drone.jsonnet \
    PLUGIN_TARGET=test-data/drone.yml \
    PLUGIN_FORMAT=true \
    sh entrypoint.sh"
  echo "$output" >&3
  [ "$status" -eq 0 ]
}

@test ".drone.jsonnet isn't found" {
  run eval "PLUGIN_TARGET=test-data/drone.yml \
    sh entrypoint.sh"
  echo "$output" >&3
  [ "$status" -eq 0 ]
}

@test ".drone.yml isn't found" {
  run eval "PLUGIN_SOURCE=test-data/drone.jsonnet \
    PLUGIN_TARGET=test-data/drone-unknown.yml \
    sh entrypoint.sh"
  echo "$output" >&3
  [ "$status" -ne 0 ]
}

@test "case: there is diff" {
  run eval "PLUGIN_SOURCE=test-data/drone.jsonnet \
    PLUGIN_TARGET=test-data/drone-failure.yml \
    PLUGIN_FORMAT=true \
    sh entrypoint.sh"
  echo "$output" >&3
  [ "$status" -ne 0 ]
}
