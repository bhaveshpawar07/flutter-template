import 'package:json_annotation/json_annotation.dart';

part 'remote_pokemon_dream_world.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemotePokemonDreamWorld{
  final String front_default;

  RemotePokemonDreamWorld({
    required this.front_default
  });

  factory RemotePokemonDreamWorld.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonDreamWorldFromJson(json);
}