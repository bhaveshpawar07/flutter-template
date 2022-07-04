import 'package:json_annotation/json_annotation.dart';
import 'remote_pokemon_species.dart';
import 'remote_pokemon_sprites.dart';
part 'remote_pokemon_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemotePokemonDetails {
  final int height;
  final int id;
  final String name;
  final int weight;
  final RemotePokemonSpecies species;
  final RemotePokemonSprites sprites;

  RemotePokemonDetails({
    required this.height,
    required this.id,
    required this.name,
    required this.weight,
    required this.species,
    required this.sprites,
  });

  factory RemotePokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonDetailsFromJson(json);
}
