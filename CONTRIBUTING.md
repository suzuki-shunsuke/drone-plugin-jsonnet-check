# Contributing

## Requirements

* [npm](https://www.npmjs.com/): to validate a commit message
* [bats](https://github.com/bats-core/bats-core)
* [drone-cli](https://github.com/drone/drone-cli)
* Docker Engine

```console
$ npm i
```

## Test

```console
$ npm t
```

Test with Drone

```console
$ npm run ci-local
```

## Build Docker image

```console
$ npm run build
```

## Commit Message Format

The commit message format of this project conforms to the [AngularJS Commit Message Format](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines).
We validate the commit message with git's `commit-msg` hook using [commitlint](http://marionebl.github.io/commitlint/#/) and [husky](https://www.npmjs.com/package/husky).
