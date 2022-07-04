import 'package:faker/faker.dart';
import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';
import 'package:flutter_template/services/pokemon/local/pokemon_local_service.dart';

class FakePokemonLocalService implements PokemonLocalService {
  @override
  Future<void> savePokemonDetails(
      {required LocalPokemonDetailsCompanion pokemon}) async {
    return;
  }

  @override
  Future<LocalPokemonDetail?> getLocalPokemon(
      {required String searchTerm}) async {
    return LocalPokemonDetail(
        id: faker.randomGenerator.integer(10),
        height: faker.randomGenerator.integer(10),
        name: faker.randomGenerator.string(10),
        url: faker.randomGenerator.string(10),
        weight: faker.randomGenerator.integer(10),
        date: faker.randomGenerator.string(10));
  }
}
