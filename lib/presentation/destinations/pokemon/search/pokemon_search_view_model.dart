import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_state.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:get_it/get_it.dart';

final pokemonSearchViewModelProvider = StateNotifierProvider.autoDispose<
    PokemonSearchViewModel, PokemonSearchScreenState>((ref) => GetIt.I.get());

abstract class PokemonSearchViewModel
    extends BaseViewModel<PokemonSearchScreen, PokemonSearchScreenState>
    implements IntentHandler<PokemonSearchScreenIntent> {
  PokemonSearchViewModel(PokemonSearchScreenState state) : super(state);

  String get searchTerm;
}
