const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{
        .default_target = .{
            .cpu_arch = .wasm64,
            .os_tag = .freestanding,
        },
    });

    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = std.builtin.OptimizeMode.ReleaseFast });

    const lib = b.addStaticLibrary(.{
        .name = "scrigs",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(lib);

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);

    // ZLS comptime check
    const exe_check = b.addStaticLibrary(.{
        .name = "scrigs",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const check = b.step("check", "Check if the code compiles with ZLS");
    check.dependOn(&exe_check.step);
}
