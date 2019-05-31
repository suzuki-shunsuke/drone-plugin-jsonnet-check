decho() {
  echo "+ $@"
  eval "$@"
}

if [ -n "$PLUGIN_SOURCE" ]; then
  JSONNET_OPTS="$JSONNET_OPTS --source $PLUGIN_SOURCE"
else
  PLUGIN_SOURCE=.drone.jsonnet
fi
if [ ! -f $PLUGIN_SOURCE ]; then
  echo "$PLUGIN_SOURCE isn't found"
  exit 0
fi
TARGET=/tmp/.drone.yml
if [ "$PLUGIN_STREAM" == "true" ]; then
  JSONNET_OPTS="--stream"
fi
if [ "$PLUGIN_FORMAT" == "true" ]; then
  JSONNET_OPTS="$JSONNET_OPTS --format"
fi
if [ -n "$PLUGIN_TARGET" ]; then
  JSONNET_OPTS="$JSONNET_OPTS --target $PLUGIN_TARGET"
else
  PLUGIN_TARGET=.drone.yml
fi
decho drone jsonnet $JSONNET_OPTS --target $TARGET || exit 1
decho diff $PLUGIN_TARGET $TARGET
