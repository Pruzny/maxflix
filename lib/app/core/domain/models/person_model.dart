import 'package:equatable/equatable.dart';

class PersonModel extends Equatable {
  const PersonModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  PersonModel copyWith({
    int? id,
    String? name,
  }) {
    return PersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
