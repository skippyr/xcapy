ICONSPATH:=~/.local/share/icons
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
	for c in $(wildcard src/*.cfg); \
	do \
		f=$${c##*/}; \
		f=$${f%.*}; \
		xcursorgen $${c} > build/xcapy/cursors/$${f}; \
	done
