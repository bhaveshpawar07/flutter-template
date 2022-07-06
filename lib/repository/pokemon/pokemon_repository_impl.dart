import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';
import 'package:flutter_template/services/pokemon/local/pokemon_local_service.dart';
import 'package:flutter_template/services/pokemon/remote/pokemon_remote_service.dart';

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
  Future<UIPokemon?> getSavedPokemons({required String searchTerm}) async {
    final LocalPokemonDetail? localPokemon =
        await pokemonLocalService.getLocalPokemon(searchTerm: searchTerm);
    logD("localPokemon $localPokemon");
    if (localPokemon == null || (checkDifferenceInHrs(localPokemon.date) > 3)) {
      return _searchPokemon(searchTerm: searchTerm);
    } else {
      return domainPokemonMapper.mapLocalPokemon(localPokemon);
    }
  }

  Future<void> _savePokemonDetails({required UIPokemon pokemon}) async {
    final LocalPokemonDetailsCompanion localPokemon =
        localPokemonMapper.map(pokemon);
    return await pokemonLocalService.savePokemonDetails(pokemon: localPokemon);
  }

  Future<UIPokemon?> _searchPokemon({required String searchTerm}) async {
    final remotePokemon = await pokemonRemoteService.searchPokemon(
        searchTerm: searchTerm.toLowerCase());
    logD(remotePokemon.toString());
    if (remotePokemon != null) {
      final UIPokemon pokemon = domainPokemonMapper.map(remotePokemon);
      _savePokemonDetails(pokemon: pokemon);
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
