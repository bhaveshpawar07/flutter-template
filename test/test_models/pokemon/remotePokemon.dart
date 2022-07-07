// ignore_for_file: file_names

import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_details.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_dream_world.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_other.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_species.dart';
import 'package:flutter_template/services/entity/poke_api/remote/remote_pokemon_sprites.dart';

final remotePokemon = RemotePokemonDetails(
  id: 1,
  height: 13,
  name: "Pikachu",
  weight: 50,
  species: RemotePokemonSpecies(
    url: "test",
    name: 'Pikachu',
  ),
  sprites: RemotePokemonSprites(
    other: RemotePokemonOther(
      dreamWorld: RemotePokemonDreamWorld(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/25.svg'),
    ),
  ),
);
