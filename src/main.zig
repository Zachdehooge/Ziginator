const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const buffer_size = 32;
    const buffer = try allocator.alloc(u8, buffer_size);
    defer allocator.free(buffer);

    const stdin = std.io.getStdIn().reader();

    std.debug.print("Enter a number: ", .{});
    const input_slice = try stdin.readUntilDelimiter(buffer, '\n');

    const input_number = try std.fmt.parseInt(isize, input_slice, 10);

    if (input_number >= -128 and input_number < 0) {
        std.debug.print("Number: {} is an i8", .{input_number});
    } else if (input_number >= 0 and input_number <= 255) {
        std.debug.print("Number: {} is a u8", .{input_number});
    } else if (input_number < -128 and input_number >= -32768) {
        std.debug.print("Number: {} is a i16", .{input_number});
    } else if (input_number > 255 and input_number <= 65353) {
        std.debug.print("Number: {} is a u16", .{input_number});
    } else if (input_number < -32768 and input_number > -2147483648) {
        std.debug.print("Number: {} is a i32", .{input_number});
    } else if (input_number > 65353 and input_number <= 4294967295) {
        std.debug.print("Number: {} is a u32", .{input_number});
    }
}
