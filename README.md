# pipenv-dockerfile

Based on pipenv's official Dockerfile.
ref. [here](https://github.com/pypa/pipenv/blob/master/Dockerfile)


## Supported TAGs

* `py3.7-alpine`
* `py3.7-slim`
* `pypy3.6-slim`


## Included packages

* curl


## How to use.

1. Place `build-deps.in` in docker context directory.
And list build dependencies here.

    ```
    build-base
    python3-dev
    ...
    ```

2. Place `runtime-deps.in` in docker context directory.
And list additional packages you want here.

    ```
    libfoo
    libbar
    ...
    ```

2. `Dockerfile`

    ```
    FROM room2352/pipenv:{TAG}

    COPY . /app
    WORKDIR /app

    CMD ...
    ```

