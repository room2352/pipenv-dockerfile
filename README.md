# pipenv-dockerfile

Based on pipenv's official Dockerfile.
ref. [here](https://github.com/pypa/pipenv/blob/master/Dockerfile)


## Included packages

* `py3.7-slim`
  * curl
* `py3.7-alpine`
  * curl


## How to use.

1. Place `packages.in` in docker context directory.
And list additional packages you want here.

    ```
    build-base
    python3-dev
    ```

2. `Dockerfile`

    ```
    FROM room2352/pipenv:{TAG}

    COPY . /app
    WORKDIR /app

    CMD ...
    ```

