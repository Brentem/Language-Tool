# Language-Tool Notes

## Useful sources
* [ziglearn](https://ziglearn.org/)
* [Zig Documentation](https://ziglang.org/documentation/)
* [How to Add Buffering to a Reader / Writer in Zig](https://zig.news/kristoff/how-to-add-buffering-to-a-writer-reader-in-zig-7jd)
* [Zig/Strings in 5 minutes](https://www.huy.rocks/everyday/01-04-2022-zig-strings-in-5-minutes)
* [What's a String Literal in Zig?](https://zig.news/kristoff/what-s-a-string-literal-in-zig-31e9)
* [Beginner's notes on Slices/Arrays/Strings](https://zig.news/david_vanderson/beginner-s-notes-on-slices-arrays-strings-5b67)

## Data structure sources

* [Best data structure for implementing a dictionary?](https://stackoverflow.com/a/10017860)

### Trie
* [Applications of tree data structure](https://www.geeksforgeeks.org/applications-of-tree-data-structure/)
* [Trie | (Insert and Search)](https://www.geeksforgeeks.org/trie-insert-and-search/)
* [Advantages of Trie Data Structure](https://www.geeksforgeeks.org/advantages-trie-data-structure/)
* [Implement a Dictionary using Trie](https://www.geeksforgeeks.org/implement-a-dictionary-using-trie/)
* [Data Structures: Tries](https://www.youtube.com/watch?v=zIjfhVPRZCg)

### Ternary Search Tree
*[Ternary Search Tree](https://www.geeksforgeeks.org/ternary-search-tree/)

## FileIO / DictionaryFile Notes
To prevent that the file will be overwritten you should change the offSet with File.seekTo().
You can also add a newline to the string so that it will be placed on the next line.
I haven't implemented this yet, because I don't know if I'll need it.

If you create a DictionaryFile struct and declare it as undefined, the initialized bool is also undefined.
This means that the DictionaryFileError is not returned.
