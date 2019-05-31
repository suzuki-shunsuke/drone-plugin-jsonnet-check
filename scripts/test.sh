decho() {
  echo "+ $@"
  eval "$@"
}

echo "case: success"
decho docker run --rm \
  -e PLUGIN_SOURCE=drone.jsonnet \
  -e PLUGIN_TARGET=drone.yml \
  -e PLUGIN_FORMAT=true \
  -v $(pwd)/test-data:/drone/src \
  -w /drone/src \
  suzukishunsuke/jsonnet-check:local || exit 1

echo "case: .drone.jsonnet isn't found"
decho docker run --rm \
  -e PLUGIN_TARGET=drone.yml \
  -v $(pwd)/test-data:/drone/src \
  -w /drone/src \
  suzukishunsuke/jsonnet-check:local || exit 1

echo "case: .drone.yml isn't found"
decho docker run --rm \
  -v $(pwd)/test-data:/drone/src \
  -w /drone/src \
  suzukishunsuke/jsonnet-check:local

echo "case: there is diff"
decho docker run --rm \
  -e PLUGIN_SOURCE=drone.jsonnet \
  -e PLUGIN_TARGET=drone-failure.yml \
  -e PLUGIN_FORMAT=true \
  -v $(pwd)/test-data:/drone/src \
  -w /drone/src \
  suzukishunsuke/jsonnet-check:local || exit 0
