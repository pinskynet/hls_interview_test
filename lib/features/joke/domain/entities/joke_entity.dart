// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class JokeEntity extends Equatable {
  final int id;
  final String description;
  final bool isFunny;

  const JokeEntity({
    required this.id,
    required this.description,
    required this.isFunny,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        isFunny,
      ];

  JokeEntity copyWith({
    int? id,
    String? description,
    bool? isFunny,
  }) {
    return JokeEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      isFunny: isFunny ?? this.isFunny,
    );
  }
}
