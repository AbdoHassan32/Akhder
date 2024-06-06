import 'package:akhder/features/Cart/data/models/item.dart';

class ItemList {
  ItemList({
      this.orders,});

  ItemList.fromJson(dynamic json) {
    if (json['items'] != null) {
      orders = [];
      json['items'].forEach((v) {
        orders?.add(OrderItem.fromJson(v));
      });
    }
  }
  List<OrderItem>? orders;
ItemList copyWith({  List<OrderItem>? items,
}) => ItemList(  orders: items ?? this.orders,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['items'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

