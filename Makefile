ICONS_PATH:=~/.local/share/icons

.PHONY: all clean install uninstall

all: xcapy

clean:
	rm -rf build;

install: all
	mkdir -p ${ICONS_PATH};
	cp -r build/xcapy ${ICONS_PATH};

uninstall:
	rm -rf ${ICONS_PATH}/xcapy;

xcapy:
	mkdir -p build/xcapy/cursors;
	cp src/index.theme LICENSE build/xcapy;
	cp -d src/symlinks/* build/xcapy/cursors;
	for cursor in $(wildcard src/*.cfg); \
	do \
		file=$${cursor##*/}; \
		xcursorgen $${cursor} > build/xcapy/cursors/$${file%.*}; \
	done
