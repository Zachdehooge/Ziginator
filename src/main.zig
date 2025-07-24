const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    _ = args.next();

    const input = args.next() orelse {
        std.debug.print("Error: Please provide one number as an argument.\n", .{});
        return error.MissingArgument;
    };

    // Ensure no extra args
    if (args.next() != null) {
        std.debug.print("Error: Only one argument is allowed.\n", .{});
        return error.TooManyArguments;
    }

    const input_number = try std.fmt.parseInt(i64, input, 10);

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
