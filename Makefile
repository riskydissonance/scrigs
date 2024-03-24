.PHONY: clean

root.wasm:
	zig build
	cp main.js zig-out/lib/

clean:
	rm -rf zig-*/
