// ignore_for_file: prefer_typing_uninitialized_variables

class FeaturedProduct {
  String? title;
  String? cName;
  String? cLogo;
  String? currencySymbols;
  int? id;
  int? productId;
  String? colorName;
  String? colorCode;
  var price, discount, newPrice;
  String? size;
  // int? itemQty;
  String? images;
  String? createAt;
  String? updateAt;

  FeaturedProduct(
      {this.title,
      this.cName,
      this.cLogo,
      this.currencySymbols,
      this.id,
      this.productId,
      this.colorName,
      this.colorCode,
      this.price,
      this.discount,
      this.newPrice,
      this.size,
      // this.itemQty,
      this.images,
      this.createAt,
      this.updateAt});

  FeaturedProduct.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cName = json['c_name'];
    cLogo = json['c_logo'];
    currencySymbols = json['currency_symbols'];

    id = json['id'];
    productId = json['product_id'];
    colorName = json['color_name'];
    colorCode = json['color_code'];
    price = json['price'];
    discount = json['discount'];
    newPrice = json['new_price'];
    size = json['size'];
    // itemQty = json['item_qty'];
    images = json['images'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['title'] = this.title;
  //   data['id'] = this.id;
  //   data['product_id'] = this.productId;
  //   data['color_name'] = this.colorName;
  //   data['color_code'] = this.colorCode;
  //   data['price'] = this.price;
  //   data['discount'] = this.discount;
  //   data['new_price'] = this.newPrice;
  //   data['size'] = this.size;
  //   data['item_qty'] = this.itemQty;
  //   data['images'] = this.images;
  //   data['create_at'] = this.createAt;
  //   data['update_at'] = this.updateAt;
  //   return data;
  // }
}
