class Product {
  final String productName;
  final String imageUrl;
  final int price;
  String desc;
  String unit;
  String category;
  String subcat;

  Product(this.productName, this.imageUrl, this.price, this.desc, this.unit,
      this.category, this.subcat);
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'] as String? ?? '', // productName
      json['image'] as String? ?? '', // imageUrl
      json['price'] as int? ?? 0, // price
      json['description'] as String? ?? '', // desc
      json['quantity'] as String? ?? '', // unit
      json['category'] as String? ?? '', // category
      json['subcategory'] as String? ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'imageUrl': imageUrl,
      'price': price,
      'desc': desc,
      'unit': unit,
      'category': category,
    };
  }

  /////
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.productName == productName;
  }

  @override
  int get hashcode => productName.hashCode.toInt();
}
