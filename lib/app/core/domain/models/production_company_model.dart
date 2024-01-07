import 'package:equatable/equatable.dart';

class ProductionCompanyModel extends Equatable {
  const ProductionCompanyModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  ProductionCompanyModel copyWith({
    int? id,
    String? name,
  }) {
    return ProductionCompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
