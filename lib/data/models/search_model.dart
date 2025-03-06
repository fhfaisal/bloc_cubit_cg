import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/search_data.dart';

class SearchModel extends Equatable {
  final String? success;
  final SearchData? data;

  const SearchModel({
    this.success,
    this.data,
  });

  factory SearchModel.fromRawJson(String str) => SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    success: json["success"],
    data: json["data"] == null ? null : SearchData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
  SearchData toEntity() => SearchData(
    category: data?.category ?? [],
    subcategory: data?.subcategory ?? [],
    businessName: data?.businessName ?? [],
  );

  SearchModel copyWith({
    String? success,
    SearchData? data,
  }) =>
      SearchModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [success, data];
}






