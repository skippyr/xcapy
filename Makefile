SHELL:=bash
ifeq ($(shell id -u), 0)
	ICONS_PATH:=/usr/share/icons
else
	ICONS_PATH:=~/.local/share/icons
endif

.PHONY: all clean install uninstall

all: xcapy

clean:
	rm -rf out;

install: all
	mkdir -p ${ICONS_PATH};
	cp -r out/xcapy ${ICONS_PATH};

uninstall:
	rm -rf ${ICONS_PATH}/xcapy;

xcapy:
	mkdir -p out/xcapy/cursors;
	cp src/index.theme LICENSE out/xcapy;
	cp -d src/symlinks/* out/xcapy/cursors;
	for c in $(wildcard src/*.cfg);                                        \
	do                                                                     \
		f=$${c##*/};                                                   \
		xcursorgen $${c} > out/xcapy/cursors/$${f%.*};                 \
	done
