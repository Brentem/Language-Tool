const std = @import("std");

const menu = @import("menu.zig");
const DictionaryFile= @import("DictionaryFile.zig").DictionaryFile;

const String = @import("String.zig").String;

const TrieNode = @import("Trie.zig").TrieNode;

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    //DictionaryFile.create_file()
    var node = try TrieNode.init();

    try node.insert("Aap", "Monkey");
    var translation: String = try node.getTranslation("aap");

    std.debug.print("Translation: {s}", .{translation.content.items});

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            run = false;
        }
    }
}