.PHONY: clean build test

test:
	zig build test

build:
	zig build
	cp js/*.js zig-out/lib/
	mkdir -p /host/Downloads/scrigs
	cp zig-out/lib/* /host/Downloads/scrigs

clean:
	rm -rf zig-*/
