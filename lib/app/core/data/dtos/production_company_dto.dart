import 'dart:convert';

import '../../domain/models/production_company_model.dart';

class ProductionCompanyDto extends ProductionCompanyModel {
  const ProductionCompanyDto({
    required super.id,
    required super.name,
  });

  factory ProductionCompanyDto.fromModel(ProductionCompanyModel model) {
    return ProductionCompanyDto(
      id: model.id,
      name: model.name,
    );
  }

  factory ProductionCompanyDto.fromMap(Map<String, dynamic> map) {
    return ProductionCompanyDto(
      id: map["id"],
      name: map["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  factory ProductionCompanyDto.fromJson(String source) {
    return ProductionCompanyDto.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
