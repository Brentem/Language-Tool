const std = @import("std");

const ALPHABET_SIZE = 26;

pub const TrieNode = struct
{
    children: [ALPHABET_SIZE]?*TrieNode,
    isEndOfWord: bool,

    // Works only with lower case!
    fn charToIndex(char: u8) u8
    {
        return char - 97; // 97 == 'a'
    }

    pub fn init() !*TrieNode
    {
        var gpa = std.heap.GeneralPurposeAllocator(.{}){};
        const allocator = gpa.allocator();

        var node : *TrieNode = try allocator.create(TrieNode);
        node.isEndOfWord = false;

        var i: u8 = 0;
        while(i < ALPHABET_SIZE)
        {
            node.children[i] = null;

            i+= 1;
        }

        return node;
    }

    pub fn insert(self: *TrieNode, word: []const u8) !void
    {
        var pCrawl: *TrieNode = self;

        for (word) |character| {
            var index: u8 = TrieNode.charToIndex(character);

            if(pCrawl.children[index] == null){
                pCrawl.children[index] = try TrieNode.init();
            }

            pCrawl = pCrawl.children[index].?;
        }

        pCrawl.isEndOfWord = true;
    }

    pub fn search(self: *TrieNode, word: []const u8) bool
    {
        var pCrawl: *TrieNode = self;

        for(word) |character| {
            var index: u8 = TrieNode.charToIndex(character);

            if(pCrawl.children[index] == null){
                return false;
            }

            pCrawl = pCrawl.children[index].?;
        }

        return pCrawl.isEndOfWord;
    }
};
