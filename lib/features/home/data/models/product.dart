class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.weight,
    this.stockNum,
    this.kgOrL,
    this.imageUrl,
    this.category,
    this.isFav,
    this.userId,
    this.docId,
    this.favDocId,
    this.itemCount,
  this.itemCountInFirebase
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    weight = json['weight'];
    stockNum = json['stockNum'];
    kgOrL = json['kgOrL'];
    imageUrl = json['imageUrl'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    isFav = json['isFav'];
    docId = json['docId'];
    favDocId = json['favDocId'];
    userId = json['userId'];
    itemCount = json['itemCount'];
    itemCountInFirebase = json['itemCountInFirebase'];
  }
  int? id;
  String? name;
  String? description;
  double? price;
  double? weight;
  int? stockNum;
  bool? kgOrL;
  String? imageUrl;
  Category? category;
  bool? isFav = false;
  String? docId = '';
  String? favDocId='';
  String? userId;
  int? itemCount = 1;
  int? itemCountInFirebase = 0;
  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? weight,
    int? stockNum,
    bool? kgOrL,
    String? imageUrl,
    Category? category,
    bool? isFav = false,
    String? docId = '',
    String? favDocId = '',
    String? userId,
    int? itemCount = 1,
    int? itemCountInFirebase = 0,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        weight: weight ?? this.weight,
        stockNum: stockNum ?? this.stockNum,
        kgOrL: kgOrL ?? this.kgOrL,
        imageUrl: imageUrl ?? this.imageUrl,
        category: category ?? this.category,
        isFav: isFav ?? this.isFav,
        docId: docId ?? this.docId,
        favDocId: favDocId ?? this.favDocId,
        userId: userId ?? this.userId,
        itemCount: itemCount ?? this.itemCount,
        itemCountInFirebase: itemCountInFirebase ?? this.itemCountInFirebase,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['weight'] = weight;
    map['stockNum'] = stockNum;
    map['kgOrL'] = kgOrL;
    map['imageUrl'] = imageUrl;
    map['userId'] = userId;
    map['docId'] = docId;
    map['favDocId'] = favDocId;
    map['isFav'] = isFav;
    map['itemCoun']=itemCount;
    map['itemCountInFirebase']=itemCountInFirebase;

    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.name,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
  Category copyWith({
    int? id,
    String? name,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
