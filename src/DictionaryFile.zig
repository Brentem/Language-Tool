const std = @import("std");

const String = @import("String.zig").String;

const Dir = std.fs.Dir;
const File = std.fs.File;

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
        if(self.initialized == false)
        {
            return DictionaryFileError.DictionaryFileNotInitialized;
        }

        var dir = try self.open_dir();
        defer dir.close();
        
        const file = try dir.createFile(
            self.fileName.content.items,
            .{.read = true},
        );

        file.close();
    }

    pub fn write_file(self: *DictionaryFile, contents: []const u8) !void{
        if(self.initialized == false)
        {
            return DictionaryFileError.DictionaryFileNotInitialized;
        }

        var dir = try self.open_dir();
        defer dir.close();

        const file = try self.open_file(dir);
        defer file.close();

        try file.writeAll(contents);
    }

    pub fn read_file(self: *DictionaryFile, buffer: []u8) !void{
        if(self.initialized == false)
        {
            return DictionaryFileError.DictionaryFileNotInitialized;
        }

        var dir = try self.open_dir();
        defer dir.close();

        const file = try self.open_file(dir);
        defer file.close();

        var temp = try file.readAll(buffer);
        _ = temp;
    }

    fn open_dir(self: *DictionaryFile) !Dir{
        return std.fs.openDirAbsolute(
            self.directoryName.content.items,
            .{.access_sub_paths = true}
        );
    }

    fn open_file(self: *DictionaryFile, dir: Dir) !File{
        return dir.openFile(
            self.fileName.content.items,
            .{.mode = std.fs.File.OpenMode.read_write},
        );
    }
};