ifeq ($(shell id -u), 0)
	ICONSPATH:=/usr/share/icons
else
	ICONSPATH:=~/.local/share/icons
endif
SHELL:=bash

.PHONY: all clean install uninstall

all: xcapy

clean:
	rm -rf build;

install: all
	mkdir -p ${ICONSPATH};
	cp -r build/xcapy ${ICONSPATH};

uninstall:
	rm -rf ${ICONSPATH}/xcapy;

xcapy:
	mkdir -p build/xcapy/cursors;
	cp src/index.theme LICENSE build/xcapy;
	cp -d src/symlinks/* build/xcapy/cursors;
	for cursor in $(wildcard src/*.cfg); \
	do \
		file=$${cursor##*/}; \
		file=$${file%.*}; \
		xcursorgen $${cursor} > build/xcapy/cursors/$${file}; \
	done
