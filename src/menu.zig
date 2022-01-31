const std = @import("std");

pub fn printMenu() !void
{
    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll("\n---Menu---\n");
    try stdout.writeAll("1: DE - NL\n");
    try stdout.writeAll("2: NL - DE\n");
    try stdout.writeAll("q: Quit\n");
}

pub fn getInput() !u8
{
    const stdin = std.io.getStdIn().reader();

    var input: u8 = 0;
    input = try stdin.readByte();
    return input;
}