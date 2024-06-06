class OrderItem {
  OrderItem({
    this.name,
    this.quantity,
    this.price,
    this.currency,});

  OrderItem.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }
  String? name;
  int? quantity;
  String? price;
  String? currency;
  OrderItem copyWith({  String? name,
    int? quantity,
    String? price,
    String? currency,
  }) => OrderItem(  name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    currency: currency ?? this.currency,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['currency'] = currency;
    return map;
  }

}