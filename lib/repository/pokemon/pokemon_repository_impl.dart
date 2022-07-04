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
  Future<Pokemon?> getSavedPokemons({required String searchTerm}) async {
    final LocalPokemonDetail? localPokemon =
        await pokemonLocalService.getLocalPokemon(searchTerm: searchTerm);
    if (localPokemon == null || (checkDifferenceInHrs(localPokemon.date) > 3)) {
      return searchPokemon(searchTerm: searchTerm);
    } else {
      return domainPokemonMapper.mapLocalPokemon(localPokemon);
    }
  }

  @override
  Future<void> savePokemonDetails({required Pokemon pokemon}) async {
    final LocalPokemonDetailsCompanion localPokemon =
        localPokemonMapper.map(pokemon);
    return await pokemonLocalService.savePokemonDetails(pokemon: localPokemon);
  }

  @override
  Future<Pokemon?> searchPokemon({required String searchTerm}) async {
    final remotePokemon =
        await pokemonRemoteService.searchPokemon(searchTerm: searchTerm.toLowerCase());
    if (remotePokemon != null) {
      final Pokemon pokemon = domainPokemonMapper.map(remotePokemon);
      savePokemonDetails(pokemon: pokemon);
      return pokemon;
    } else {
      return null;
    }
  }

  int checkDifferenceInHrs(String timeFromDB) {
    final dbTime = DateTime.parse(timeFromDB);
    final currentTime = DateTime.now().toUtc();
    final difference = currentTime.difference(dbTime);
    return difference.inHours;
  }
}
