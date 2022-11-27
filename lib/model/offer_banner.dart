class OfferBanner {
  int? id;
  String? image;
  int? companyId;
  int? subCateId;
  int? categoryId;
  int? isActive;

  OfferBanner(
      {this.id,
      this.image,
      this.companyId,
      this.subCateId,
      this.categoryId,
      this.isActive});

  OfferBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    companyId = json['company_id'];
    subCateId = json['sub_cate_id'];
    categoryId = json['category_id'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['company_id'] = companyId;
    data['sub_cate_id'] = subCateId;
    data['category_id'] = categoryId;
    data['is_active'] = isActive;
    return data;
  }
}
