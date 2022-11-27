class SubCategory {
  int? subCategoryId;
  String? subCategoryName;
  int? cateId;
  String? cateName;
  int? subCateId;
  String? subCateName;
  int? categoryId;
  String? categoryName, subCategoryImg;

  SubCategory({
    required this.subCategoryId,
    required this.subCategoryName,
    required this.cateId,
    required this.cateName,
    required this.subCateId,
    required this.subCateName,
    required this.categoryId,
    required this.categoryName,
    required this.subCategoryImg,
  });

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategoryName = json['sub_category_name'];
    cateId = json['cate_id'];
    cateName = json['cate_name'];
    subCateId = json['sub_cate_id'];
    subCateName = json['sub_cate_name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    subCategoryImg = json['sub_category_img'];
  }
}
