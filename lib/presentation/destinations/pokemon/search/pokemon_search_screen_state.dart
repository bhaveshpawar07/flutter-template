import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_search_screen_state.freezed.dart';

@freezed
class PokemonSearchScreenState
    with _$PokemonSearchScreenState
    implements ScreenState {
  factory PokemonSearchScreenState(
      {required UIToolbar toolbar,
      required bool showLoading,
      required UIPokemon? pokemon}) = _PokemonSearchScreenState;
}
