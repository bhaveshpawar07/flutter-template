import 'package:json_annotation/json_annotation.dart';

part 'remote_pokemon_dream_world.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemotePokemonDreamWorld {
  @JsonKey(name: "front_default")
  final String frontDefault;

  RemotePokemonDreamWorld({required this.frontDefault});

  factory RemotePokemonDreamWorld.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonDreamWorldFromJson(json);
}
