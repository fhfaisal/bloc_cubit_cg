import 'package:equatable/equatable.dart';

class Subcategory extends Equatable {
  final int? id;
  final String? name;
  final String? categoryId;

  const Subcategory({
    this.id,
    this.name,
    this.categoryId,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    name: json["name"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category_id": categoryId,
  };

  Subcategory copyWith({
    int? id,
    String? name,
    String? categoryId,
  }) =>
      Subcategory(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
      );

  @override
  List<Object?> get props => [id, name, categoryId];
}