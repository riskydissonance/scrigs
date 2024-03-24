//const std = @import("std");

//const Game = struct {};
extern fn print(i32) void;

export fn add(x: i32, y: i32) void {
    print(x + y);
}
