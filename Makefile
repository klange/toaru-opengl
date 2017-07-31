AUTODEP=${TOARU_SYSROOT}/../util/auto-dep.py
CC=i686-pc-toaru-gcc
CFLAGS=-O3 -m32 -Wa,--32 -g -I${TOARU_SYSROOT}/../userspace -std=c99 -U__STRICT_ANSI__ -L${TOARU_SYSROOT}/usr/lib

all: gears teapot

%: %.c
	${CC} -o $@ ${CFLAGS} -fPIE $(shell ${AUTODEP} --cflags $<) $< $(shell ${AUTODEP} --libs $<) -lc

