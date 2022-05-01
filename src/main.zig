const std = @import("std");

const menu = @import("menu.zig");
const language = @import("language.zig");
const io = @import("file_io.zig");

const Word = language.Word;
const String = language.String;

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    var word: Word = undefined;
    try word.init("Vertaling", "Taal");

    const temp = "text.txt";
    var buffer: [50]u8 = undefined;

    try io.create_file(temp);
    try io.write_file(temp, "Test Test Test");
    try io.read_file(temp, &buffer);

    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll(&buffer);

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