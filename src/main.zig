const menu = @import("menu.zig");

pub fn main() !void {
    try menu.printMenu();
    var run: bool = true;

    while(run)
    {
        var input: u8 = try menu.getInput();
        if(input == 'q')
        {
            run = false;
        }
    }
}