// ignore_for_file: file_names

import 'package:flutter_template/services/base/database/pokemon/pokemon_app_db.dart';

final localPokemon = LocalPokemonDetail(
  id: 1,
  height: 13,
  name: "Pikachu",
  url:
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/25.svg",
  weight: 50,
  date: DateTime.now().toUtc().toString(),
);

final oldLocalPokemon = LocalPokemonDetail(
  id: 1,
  height: 13,
  name: "Pikachu",
  url:
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/25.svg",
  weight: 50,
  date: "2022-07-07 06:04:39.695Z",
);
