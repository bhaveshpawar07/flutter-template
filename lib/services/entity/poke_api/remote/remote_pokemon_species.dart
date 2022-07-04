import 'package:json_annotation/json_annotation.dart';

part 'remote_pokemon_species.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemotePokemonSpecies{
  final String name;
  final String url;

  RemotePokemonSpecies({
    required this.name,
    required this.url
  });

  factory RemotePokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonSpeciesFromJson(json);
}