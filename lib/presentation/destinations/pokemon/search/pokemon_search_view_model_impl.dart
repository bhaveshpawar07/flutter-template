import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonSearchViewModelImpl extends PokemonSearchViewModel {
  final SearchNavigator searchNavigator;
  final PokemonRepository pokemonRepository;
  final _searchTermSubject = BehaviorSubject.seeded("");

  PokemonSearchViewModelImpl(
      {required this.searchNavigator, required this.pokemonRepository})
      : super(_initialState);

  @override
  String get searchTerm =>
      _searchTermSubject.hasValue ? _searchTermSubject.value : "";

  static PokemonSearchScreenState get _initialState => PokemonSearchScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.searchPageTitle,
          hasBackButton: true,
        ),
        showLoading: false,
        pokemon: null,
      );

  @override
  onInit() {
    // listenDebounce<String>(
    //     stream: _searchTermSubject,
    //     debounceDuration: const Duration(microseconds: 400),
    //     onData: (newSearchTerm) async {
    //       if (newSearchTerm.isNotEmpty && newSearchTerm.isBlank != true) {
    //         setState((state) => state.copyWith(showLoading: true));
    //         final pokemon = await pokemonRepository.getSavedPokemons(
    //             searchTerm: newSearchTerm);
    //         if (pokemon == null) {
    //           setState((state) => state.copyWith(showLoading: false));
    //           setState((state) => state.copyWith(pokemon: null));
    //           return;
    //         }
    //         setState((state) =>
    //             state.copyWith(showLoading: false, pokemon: pokemon));
    //       } else {
    //         setState((state) => state.copyWith(showLoading: false));
    //         setState((state) => state.copyWith(pokemon:null);
    //       }
    //     });
  }

  @override
  void onIntent(PokemonSearchScreenIntent intent) {
    intent.when(
      back: () => searchNavigator.back(),
      search: (newSearchTerm) async {
        if (newSearchTerm != searchTerm) {
          _searchTermSubject.add(searchTerm);
          setState((state) => state.copyWith(showLoading: true));
          final pokemon = await pokemonRepository.getSavedPokemons(
              searchTerm: newSearchTerm);
          if (pokemon == null) {
            setState((state) => state.copyWith(showLoading: false));
            setState((state) => state.copyWith(pokemon: null));
            return;
          }
          setState(
              (state) => state.copyWith(showLoading: false, pokemon: pokemon));
        }
      },
    );
  }
}
