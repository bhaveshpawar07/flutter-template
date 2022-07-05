import 'package:flutter_template/domain/pokemon/search_pokemon_use_case.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';

import '../../presentation/entity/pokemon/ui_pokemon.dart';

class SearchPokemonUseCaseImpl extends SearchPokemonUseCase {
  final PokemonRepository pokemonRepository;

  SearchPokemonUseCaseImpl({required this.pokemonRepository});

  @override
  Future<UIPokemon?> callInternal(String param) {
    return pokemonRepository.searchPokemon(searchTerm: param);
  }
}
