const std = @import("std");

pub fn main() !void{
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    var read_buffer:[16]u8 = undefined;
    var buf = std.io.bufferedReader(stdin);

    var read = buf.reader();
    const set_msg = try read.readUntilDelimiterOrEof(&read_buffer, '\n');

    try stdout.print("Set axis", .{});

    if(set_msg)|m|{
        try stdout.print("{s}", .{m});
    }
}