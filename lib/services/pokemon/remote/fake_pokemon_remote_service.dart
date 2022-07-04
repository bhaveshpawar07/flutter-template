import 'package:faker/faker.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_details.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_dream_world.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_other.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_species.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_sprites.dart';
import 'package:flutter_template/services/pokemon/remote/pokemon_remote_service.dart';

class FakePokemonRemoteService implements PokemonRemoteService{
  @override
  Future<List<RemotePokemonDetails>> searchPokemon({required String searchTerm}) async{
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
        5,
        (index) => RemotePokemonDetails(
            height: faker.randomGenerator.integer(20),
            id: faker.randomGenerator.integer(10),
            name: faker.person.name(),
            weight: faker.randomGenerator.integer(20),
            species: RemotePokemonSpecies(name:faker.person.name(), url:faker.randomGenerator.string(100)),
            sprites: RemotePokemonSprites(other: RemotePokemonOther(dream_world: RemotePokemonDreamWorld(front_default: faker.randomGenerator.string(100))))));
  }

}