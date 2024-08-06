import 'package:isar/isar.dart';

part 'joke_collection.g.dart';

@collection
class JokeCollection {
  final Id? id;
  final String? description;
  final bool? isFunny;

  JokeCollection({
    this.id,
    this.description,
    this.isFunny,
  });
}
