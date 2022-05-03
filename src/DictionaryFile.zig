const std = @import("std");

const StringNamespace = @import("String.zig");
const String = StringNamespace.String;

const DictionaryFileError = error{
    DictionaryFileNotInitialized
};

pub const DictionaryFile = struct
{
    directoryName: String,
    fileName: String,
    initialized: bool = false,

    pub fn init(nameOfFile: []const u8, nameOfDirectory: []const u8) !DictionaryFile{
        const file = DictionaryFile{
            .directoryName = try String.init(nameOfDirectory),
            .fileName = try String.init(nameOfFile),
            .initialized = true
        };

        return file;
    }

    pub fn create_file(self: *DictionaryFile) !void{
        if(!self.initialized)
        {
            return DictionaryFileError.DictionaryFileNotInitialized;
        }

        var dir = try std.fs.openDirAbsolute(
            self.directoryName.content.items,
            .{.access_sub_paths = true}
        );
        defer dir.close();
        
        const file = try dir.createFile(
            self.fileName.content.items,
            .{.read = true},
        );

        file.close();
    }

    pub fn write_file(self: *DictionaryFile, contents: []const u8) !void{
        if(!self.initialized)
        {
            return DictionaryFileError.DictionaryFileNotInitialized;
        }

        var dir = try std.fs.openDirAbsolute(
            self.directoryName.content.items,
            .{.access_sub_paths = true}
        );
        defer dir.close();

        const file = try dir.openFile(
            self.fileName.content.items,
            .{.mode = std.fs.File.OpenMode.write_only},
        );
        defer file.close();

        try file.writeAll(contents);
    }

    pub fn read_file(self: *DictionaryFile, buffer: []u8) !void{
        if(!self.initialized)
        {
            return DictionaryFileError.DictionaryFileNotInitialized;
        }

        var dir = try std.fs.openDirAbsolute(
            self.directoryName.content.items,
            .{.access_sub_paths = true}
        );
        defer dir.close();

        const file = try dir.openFile(
            self.fileName.content.items,
            .{},
        );
        defer file.close();

        var temp = try file.readAll(buffer);

        if(temp > 0)
        {
            // Do something usefull or replace this.
        }
    }
};