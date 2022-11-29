FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y update

RUN apt-get -y install clang

COPY . /usr/src/cpp_test

WORKDIR /usr/src/cpp_test

RUN clang++ -o Test main.cpp

CMD [ "./Test" ]