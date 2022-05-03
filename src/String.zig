const std = @import("std");
const ArrayList = std.ArrayList;

var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();

pub const String = struct
{
    content: ArrayList(u8),

    pub fn init(str: []const u8) !String
    {
        var output = String{
            .content = ArrayList(u8).init(allocator)
        };

        for(str) |c|
        {
            try output.content.append(c);
        }

        return output;
    }
};