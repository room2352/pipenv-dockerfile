# pipenv-dockerfile

Based on pipenv's official Dockerfile.
ref. [here](https://github.com/pypa/pipenv/blob/master/Dockerfile)

## Included packages

### With dev packages
* `py3.7-slim`
  * curl
  * build-essential
  * python3.7-dev
* `py3.7-alpine`
  * curl
  * build-base
  * python3-dev

### Without dev packages
* `py3.7-slim-nodev`
  * curl
* `py3.7-alpine-nodev`
  * curl
