const std = @import("std");

const menu = @import("menu.zig");
const language = @import("language.zig");

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    const word = language.Word.init("Nederlands", "Duits");

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            std.debug.print("Test data: {s}\n", .{word.german});
            run = false;
        }
    }
}