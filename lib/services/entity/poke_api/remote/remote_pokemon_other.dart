import 'remote_pokemon_dream_world.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_pokemon_other.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemotePokemonOther {
  @JsonKey(name:"dream_world")
  final RemotePokemonDreamWorld dreamWorld;

  RemotePokemonOther({required this.dreamWorld});

  factory RemotePokemonOther.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonOtherFromJson(json);
}
