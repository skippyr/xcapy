ifeq ($(shell id -u), 0)
	ICONS_DIRECTORY:=/usr/share/icons
else
	ICONS_DIRECTORY:=~/.local/share/icons
endif
SHELL:=bash

.PHONY: all clean install uninstall

all: xcapy

clean:
	rm -rf build;

install: all
	mkdir -p ${ICONS_DIRECTORY};
	cp -r build/xcapy ${ICONS_DIRECTORY};

uninstall:
	rm -rf ${ICONS_DIRECTORY}/xcapy;

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
