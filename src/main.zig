const std = @import("std");

const menu = @import("menu.zig");
const language = @import("language.zig");
const Word = language.Word;
const String = language.String;

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    var word: Word = undefined;
    try word.init("Vertaling", "Taal");

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            var str = word.GetTranslation();
            std.debug.print("Test data: {s}\n", .{str.content.items});
            run = false;
        }
    }
}