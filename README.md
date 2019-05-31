# drone-plugin-jsonnet-check

[![GitHub last commit](https://img.shields.io/github/last-commit/suzuki-shunsuke/drone-plugin-jsonnet-check.svg)](https://github.com/suzuki-shunsuke/drone-plugin-jsonnet-check)
[![License](http://img.shields.io/badge/license-mit-blue.svg?style=flat-square)](https://raw.githubusercontent.com/suzuki-shunsuke/drone-plugin-jsonnet-check/master/LICENSE)

The [Drone plugin](https://docs.drone.io/plugins/) to check whether .drone.yml is generated from .drone.jsonnet properly.

## Overview

At Drone v1, [jsonnet](https://jsonnet.org) is recommended officially.

https://docs.drone.io/user-guide/pipeline/migrating/

> To simplify your configuration we recommend using jsonnet.

And when [Drone's Jsonnet extension](https://docs.drone.io/extend/config/jsonnet/) isn't supported,
you have to convert .drone.jsonnet to .drone.yml and commit them.

This Drone plugin tests whether .drone.yml is generated from .drone.jsonet properly.
This converts .drone.jsonnet to the yaml format and exit with return code non zero if it is different from .drone.yml .

## How to use

.drone.jsonnet

```jsonnet
{
  kind: "pipeline",
  name: "test",
  steps: [
    {
      name: "test .drone.yml",
      image: "suzukishunsuke/jsonnet-check:v0.1.0",
      settings: {
        format: true,
      },
    },
  ],
}
```

Success case

```console
$ drone exec
[test .drone.yml:0] + drone jsonnet --format --target /tmp/.drone.yml
[test .drone.yml:1] + diff .drone.yml /tmp/.drone.yml
```

Failure case

```console
$ drone exec
[test .drone.yml:0] + drone jsonnet --format --target /tmp/.drone.yml
[test .drone.yml:1] + diff .drone.yml /tmp/.drone.yml
[test .drone.yml:2] --- .drone.yml
[test .drone.yml:3] +++ /tmp/.drone.yml
[test .drone.yml:4] @@ -12,5 +12,4 @@
[test .drone.yml:5]    settings:
[test .drone.yml:6]      format: true
[test .drone.yml:7]
[test .drone.yml:8] -
[test .drone.yml:9]  ...
2019/06/01 00:33:27 test .drone.yml : exit code 1
```

## Settings

### Required settings

Nothing.

### Optional settings

name | default | value | description
--- | --- | --- | ---
stream | false | true/false | drone jsonnet command's `--stream` flag
format | false | true/false | drone jsonnet command's `--format` flag
source | .drone.jsonnet | | drone jsonnet command's `--source` flag
target | .drone.yml | | drone jsonnet command's `--target` flag

## Contribution

See [CONTRIBUTING.md](CONTRIBUTING.md) .

## License

[MIT](LICENSE)
