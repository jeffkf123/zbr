#!/bin/bash

docker run --rm -it \
  -v `pwd`/main.ml:/home/opam/hw2/main.ml:ro \
  -v `pwd`/hw.ml:/home/opam/hw2/hw.ml:ro \
  ec3204_hw2 /bin/bash -c "./build && ./main.native"
