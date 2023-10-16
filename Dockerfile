FROM ocaml/opam:ubuntu-20.04

LABEL maintainer "Sunbeom So <sunbeomso@gist.ac.kr>"

RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y wget unzip git build-essential software-properties-common curl m4 ocaml-findlib libgmp-dev autoconf vim

# OCaml 4.14.1
RUN opam init && eval $(opam env)
RUN opam switch create 4.14.1 && eval $(opam env)

# OCaml deps
RUN opam update && opam upgrade
RUN eval $(opam env) && opam install -y conf-m4.1 ocamlfind ocamlbuild batteries

RUN mkdir /home/opam/hw2
WORKDIR /home/opam/hw2

COPY _tags /home/opam/hw2/_tags
COPY build /home/opam/hw2/build
COPY dfa.ml /home/opam/hw2/dfa.ml
COPY dfa.mli /home/opam/hw2/dfa.mli
COPY main.ml /home/opam/hw2/main.ml
COPY nfa.ml /home/opam/hw2/nfa.ml
COPY nfa.mli /home/opam/hw2/nfa.mli
COPY regex.ml /home/opam/hw2/regex.ml

CMD ["/bin/bash"]
