const std = @import("std");

const Item = struct {
    name: []const u8,
    price: f64,
};

const ItemList = struct {
    items: [10]Item,
    count: usize,
};

pub fn main() void {
    var itemList: ItemList = .{ .items = undefined, .count = 0 };

    // Add items to the list
    addItem(&itemList, "Item 1", 10.99);
    addItem(&itemList, "Item 2", 20.49);
    addItem(&itemList, "Item 3", 5.99);

    // Print the list
    printItemList(&itemList);
}

fn addItem(itemList: *ItemList, name: []const u8, price: f64) void {
    if (itemList.count < itemList.items.len) {
        const itemIndex = itemList.count;
        itemList.items[itemIndex] = .{
            .name = name,
            .price = price,
        };
        itemList.count += 1;
    }
}

fn printItemList(itemList: *ItemList) void {
    const stdout = std.io.getStdOut().writer();
    for (itemList.items) |item| {
        try stdout.print("Name: {}, Price: {:.2}\n", .{ item.name, item.price });
    }
}
