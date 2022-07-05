import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_pokemon.freezed.dart';

@freezed
class UIPokemon with _$UIPokemon implements UIListItem {
  const UIPokemon._();

  factory UIPokemon(
      {required int pokemonId,
      required int height,
      required String name,
      required String imgUrl,
      required int weight,
      required DateTime dateTime}) = _UIPokemon;

  @override
  String get key => "UIPOKEMON $pokemonId";

  @override
  Type get type => UIPokemon;
}
