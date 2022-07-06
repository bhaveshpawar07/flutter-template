import 'package:flutter_template/domain/pokemon/get_pokemon_stream_use_case.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';

class GetPokemonStreamUseCaseImpl extends GetPokemonStreamUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonStreamUseCaseImpl({required this.pokemonRepository});

  @override
  Future<UIPokemon?> callInternal(String param) {
    return pokemonRepository.getSavedPokemons(searchTerm: param);
  }
}
