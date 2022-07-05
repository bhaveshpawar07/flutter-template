import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_search_screen_intent.freezed.dart';

@freezed
class PokemonSearchScreenIntent
    with _$PokemonSearchScreenIntent
    implements BaseIntent {
  factory PokemonSearchScreenIntent.back() = _PokemonSearchScreenIntent_Back;

  factory PokemonSearchScreenIntent.search({required String searchTerm}) =
      _PokemonSearchScreenIntent_Search;
}
