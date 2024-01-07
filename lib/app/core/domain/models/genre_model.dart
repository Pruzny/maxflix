// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  const GenreModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  GenreModel copyWith({
    int? id,
    String? name,
  }) {
    return GenreModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
