.PHONY: clean

root.wasm:
	zig build

clean:
	rm -rf zig-*/
