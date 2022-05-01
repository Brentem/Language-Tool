const std = @import("std");

pub fn create_file(fileName: []const u8) !void{
    const file = try std.fs.cwd().createFile(
        fileName,
        .{.read = true},
    );

    file.close();
}

pub fn write_file(fileName: []const u8, contents: []const u8) !void{
    const file = try std.fs.cwd().openFile(
        fileName,
        .{.mode = std.fs.File.OpenMode.write_only},
    );
    defer file.close();

    try file.writeAll(contents);
}

pub fn read_file(fileName: []const u8, buffer: []u8) !void{
    const file = try std.fs.cwd().openFile(
        fileName,
        .{},
    );
    defer file.close();

   var temp = try file.readAll(buffer);

   if(temp > 0)
   {
        // Do something usefull of replace this.
   }
}