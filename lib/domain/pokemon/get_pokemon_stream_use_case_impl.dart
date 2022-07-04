
import 'package:flutter_template/domain/pokemon/get_pokemon_stream_use_case.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';

import '../../foundation/unit.dart';
import '../entity/pokemon/pokemon.dart';

class GetPokemonStreamUseCaseImpl extends GetPokemonStreamUseCase{

    final PokemonRepository pokemonRepository;

  GetPokemonStreamUseCaseImpl({required this.pokemonRepository});

    @override
    Stream<List<Pokemon>> callInternal(Unit param) {
        return pokemonRepository.getSavedPokemons();
    }

}