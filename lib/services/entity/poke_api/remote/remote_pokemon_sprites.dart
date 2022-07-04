import 'package:json_annotation/json_annotation.dart';
import 'remote_pokemon_other.dart';
part 'remote_pokemon_sprites.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemotePokemonSprites{
  final RemotePokemonOther other;

  RemotePokemonSprites({
    required this.other
  });

  factory RemotePokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonSpritesFromJson(json);
}