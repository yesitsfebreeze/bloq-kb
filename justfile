set shell := ["sh", "-cu"]
set windows-shell := ["powershell.exe", "-NoProfile", "-Command"]

build:
    docker compose up --abort-on-container-exit
    docker compose down

build-left:
    docker compose run --rm -e BUILD_VARIANT=keymap -e BUILD_TARGET=left zmk-build

build-right:
    docker compose run --rm -e BUILD_VARIANT=keymap -e BUILD_TARGET=right zmk-build

build-all:
    docker compose run --rm -e BUILD_VARIANT=all -e BUILD_TARGET=both zmk-build

build-fresh:
    docker compose down --volumes
    docker compose run --rm --build -e BUILD_VARIANT=all zmk-build
    docker compose down

sync:
    git pull

update:
    git push --force