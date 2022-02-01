//Note: This is not finished, there are probably better ways
// to do string manipulation in zig! I should also make a 
// better design, because I don't think this struct will be
// that usefull.

const STR_SIZE: u8 = 50;

pub const Word = struct 
{
    dutch: [STR_SIZE]u8 = undefined,
    german: [STR_SIZE]u8 = undefined,

    pub fn init(d: []const u8, g: []const u8) Word
    {
        var word: Word = undefined;

        for (d) |character, i|
        {
            word.dutch[i] = character;
            index = i;
        }

        for (g) |character, i|
        {
            word.german[i] = character;
            index = i;
        }

        return word;
    }
};