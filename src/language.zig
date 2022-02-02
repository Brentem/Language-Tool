// Note: Not finished

const std = @import("std");
const ArrayList = std.ArrayList;

var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();

pub const String = struct
{
    content: ArrayList(u8),

    pub fn init(self: *String, str: []const u8) !void
    {
        self.content = ArrayList(u8).init(allocator);

        for(str) |c|
        {
            try self.content.append(c);
        }
    }
};

pub const Word = struct 
{
    translation: ArrayList(String),
    language: ArrayList(String),

    pub fn init(self: *Word, t: []const u8, l: []const u8) !void 
    {
        self.translation = ArrayList(String).init(allocator);
        self.language = ArrayList(String).init(allocator);

        var str: String = undefined;
        try str.init(t);
        try self.translation.append(str);

        try str.init(l);
        try self.language.append(str);
    }

    //Note: Obviously you should be able to select which item you want.
    pub fn GetTranslation(self: *Word) String
    {
        var str: String = undefined;
        str = self.translation.items[0];

        return str;
    }
};