import 'package:flutter_template/domain/entity/pokemon/pokemon.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';
import 'package:flutter_template/services/pokemon/remote/pokemon_remote_service.dart';

import '../../services/pokemon/local/pokemon_local_service.dart';
import 'domain_pokemon_mapper.dart';
import 'local_pokemon_mapper.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonLocalService pokemonLocalService;
  final PokemonRemoteService pokemonRemoteService;
  final DomainPokemonMapper domainPokemonMapper;
  final LocalPokemonMapper localPokemonMapper;
  PokemonRepositoryImpl(
      {required this.pokemonRemoteService,
      required this.pokemonLocalService,
      required this.domainPokemonMapper,
      required this.localPokemonMapper});

  @override
  Stream<List<Pokemon>> getSavedPokemons() {
    return pokemonLocalService.getLocalPokemon().map((listOfPokemon) =>
        domainPokemonMapper.mapLocalPokemonList(listOfPokemon));
  }

  @override
  Future<void> savePokemonDetails({required Pokemon pokemon}) async {
    final LocalPokemonDetailsCompanion localPokemon =
        localPokemonMapper.map(pokemon);
    return await pokemonLocalService.savePokemonDetails(pokemon: localPokemon);
  }

  @override
  Future<List<Pokemon>> searchPokemon({required String searchTerm}) async {
    final remotePokemonList =
        await pokemonRemoteService.searchPokemon(searchTerm: searchTerm);
    return domainPokemonMapper.mapList(remotePokemonList);
  }
}
