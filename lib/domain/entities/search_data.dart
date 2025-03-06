import 'package:equatable/equatable.dart';

import 'category.dart';
import 'sub_category.dart';

class SearchData extends Equatable {
  final List<Category>? category;
  final List<Subcategory>? subcategory;
  final List<dynamic>? businessName;

  const SearchData({
    this.category,
    this.subcategory,
    this.businessName,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
    category: json["category"] == null
        ? []
        : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
    subcategory: json["subcategory"] == null
        ? []
        : List<Subcategory>.from(json["subcategory"]!.map((x) => Subcategory.fromJson(x))),
    businessName: json["businessName"] == null ? [] : List<dynamic>.from(json["businessName"]!),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
    "subcategory": subcategory == null ? [] : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
    "businessName": businessName == null ? [] : List<dynamic>.from(businessName!),
  };

  SearchData copyWith({
    List<Category>? category,
    List<Subcategory>? subcategory,
    List<dynamic>? businessName,
  }) =>
      SearchData(
        category: category ?? this.category,
        subcategory: subcategory ?? this.subcategory,
        businessName: businessName ?? this.businessName,
      );

  @override
  List<Object?> get props => [category, subcategory, businessName];
}