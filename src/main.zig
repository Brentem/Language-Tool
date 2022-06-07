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
    try node.insert("test");
    try node.insert("aap");
    try node.insert("koe");

    if(node.search("test"))
    {
        std.debug.print("test exists!", .{});
    }

    if(node.search("gorilla"))
    {
        std.debug.print("gorilla exists!", .{});
    }

    if(node.search("aap"))
    {
        std.debug.print("aap exists!", .{});
    }

    if(node.search("pistol"))
    {
        std.debug.print("pistol exists!", .{});
    }

    if(node.search("koe"))
    {
        std.debug.print("koe exists!", .{});
    }

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            run = false;
        }
    }
}