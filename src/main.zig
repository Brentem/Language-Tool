const std = @import("std");

const menu = @import("menu.zig");
const DictionaryFileNameSpace = @import("DictionaryFile.zig");
const DictionaryFile = DictionaryFileNameSpace.DictionaryFile;

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    var dictionaryFile = try DictionaryFile.init("test.txt", "/mnt/hgfs/Language-Tool/Test");

    try dictionaryFile.create_file();
    try dictionaryFile.write_file("Test from FileIO!");

    var buffer : [30]u8 = undefined;
    try dictionaryFile.read_file(&buffer);
    std.debug.print("Data from test file: {s}", .{buffer});

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            run = false;
        }
    }
}