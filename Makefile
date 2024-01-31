ifeq ($(shell id -u), 0)
	ICONSPATH := /usr/share/icons
else
	ICONSPATH := ~/.local/share/icons
endif

.PHONY: all clean install uninstall

all: xcapy

clean:
	rm -rf xcapy;

install: all
	mkdir -p ${ICONSPATH};
	cp -r xcapy ${ICONSPATH};

uninstall:
	rm -rf ${ICONSPATH}/xcapy;

xcapy:
	mkdir -p xcapy/cursors;
	cp src/index.theme LICENSE xcapy;
	cp -d src/symlinks/* xcapy/cursors;
	for c in $(wildcard src/*.cfg);\
	do\
		f=$${c##*/};\
		xcursorgen $${c} > xcapy/cursors/$${f%.*};\
	done
