const std = @import("std");

const menu = @import("menu.zig");
const DictionaryFile= @import("DictionaryFile.zig").DictionaryFile;

const String = @import("String.zig").String;

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            run = false;
        }
    }
}