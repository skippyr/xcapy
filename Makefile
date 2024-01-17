ICONSPATH:=~/.local/share/icons

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
	cp index.theme LICENSE xcapy;
	cp -d src/symlinks/* xcapy/cursors;
	for c in $(wildcard src/*.cfg);\
	do\
		f=$${c##*/};\
		xcursorgen $${c} > xcapy/cursors/$${f%.*};\
	done
