const std = @import("std");

pub fn printMenu() !void
{
    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll("\n---Menu---\n");
    try stdout.writeAll("1: Set directory\n");
    try stdout.writeAll("2: Show current selected directory\n");
    try stdout.writeAll("3: Set dictionary file\n");
    try stdout.writeAll("4: Show current selected file\n");
    try stdout.writeAll("5: Create new dictionary file\n");
    try stdout.writeAll("q: Quit\n");
}

pub fn getInput() !u8
{
    const stdin = std.io.getStdIn().reader();

    var input: u8 = 0;
    input = try stdin.readByte();
    return input;
}