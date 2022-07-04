import 'package:flutter_template/domain/entity/pokemon/pokemon.dart';
import 'package:flutter_template/domain/pokemon/search_pokemon_use_case.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';

class SearchPokemonUseCaseImpl extends SearchPokemonUseCase {
  final PokemonRepository pokemonRepository;

  SearchPokemonUseCaseImpl({required this.pokemonRepository});

  @override
  Future<Pokemon?> callInternal(String param) {
    return pokemonRepository.searchPokemon(searchTerm: param);
  }
}
