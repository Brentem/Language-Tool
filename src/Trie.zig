// Inspired from: https://www.geeksforgeeks.org/trie-insert-and-search/
// https://www.geeksforgeeks.org/implement-a-dictionary-using-trie/

const std = @import("std");
const String = @import("String.zig").String;

const ALPHABET_SIZE = 26;

const MINIMUM_UPPER_CASE = 65; // A
const MAXIMUM_UPPER_CASE = 90; // Z

const MINIMUM_LOWER_CASE = 97; // a
const MAXIMUM_LOWER_CASE = 122; // z

pub const TrieNode = struct
{
    children: [ALPHABET_SIZE]?*TrieNode,
    isEndOfWord: bool,
    translation: String,

    fn charToIndex(char: u8) u8
    {
        var index : u8 = 30; // If this value as is returns it will cause a bug (Intended!)
        if((char >= MINIMUM_UPPER_CASE) and (char <= MAXIMUM_UPPER_CASE)){
            index = char - MINIMUM_UPPER_CASE;
        }
        else if((char >= MINIMUM_LOWER_CASE) and (char <= MAXIMUM_LOWER_CASE)){
            index = char - MINIMUM_LOWER_CASE;
        }
        return index;
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

    pub fn insert(self: *TrieNode, word: []const u8, translation: []const u8) !void
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
        pCrawl.translation = try String.init(translation);
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

    pub fn getTranslation(self: *TrieNode, word: []const u8) !String
    {
        var translation: String = try String.init("");

        var pCrawl: *TrieNode = self;

        for(word) |character|{
            var index: u8 = TrieNode.charToIndex(character);

            if(pCrawl.children[index] == null){
                return translation;
            }

            pCrawl = pCrawl.children[index].?;
        }

        translation = pCrawl.translation;

        return translation;
    }
};
