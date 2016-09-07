#
# Dockerfile for cpuminer
# usage: docker run creack/cpuminer --url xxxx --user xxxx --pass xxxx
# ex: docker run creack/cpuminer --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#

FROM		ubuntu:latest
MAINTAINER	Tommy Ch. Lehmann <lehmann@tommy-lehmann.de>

RUN		apt-get update -qq

RUN		apt-get install -qqy automake
RUN		apt-get install -qqy libcurl4-openssl-dev
RUN		apt-get install -qqy git
RUN		apt-get install -qqy make
RUN		apt-get install -qqy gcc

RUN		git clone https://github.com/ERFier/cpuminer-multi.git

RUN		cd cpuminer-multi && ./autogen.sh
RUN		cd cpuminer-multi && ./configure CFLAGS="-O3 -march=native" 
RUN		cd cpuminer-multi && make

WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd"]
