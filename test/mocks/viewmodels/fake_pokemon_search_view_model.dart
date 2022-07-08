import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:mocktail/mocktail.dart';

class FakePokemonSearchViewModel extends PokemonSearchViewModel with Mock {
  FakePokemonSearchViewModel(PokemonSearchScreenState state) : super(state);

  String _searchTerm = "";

  @override
  String get searchTerm => _searchTerm;

  updateSearchTerm(String newTerm) {
    _searchTerm = newTerm;
  }
}
