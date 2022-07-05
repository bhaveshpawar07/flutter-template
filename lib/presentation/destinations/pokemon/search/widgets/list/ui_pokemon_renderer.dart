import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/list/ui_pokemon_list_item.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';

class UIPokemonRenderer
    extends ListItemRenderer<UIPokemon, PokemonSearchScreenIntent> {
  const UIPokemonRenderer();
  @override
  Widget getWidget(BuildContext context, UIPokemon data,
      StreamSink<PokemonSearchScreenIntent> sink) {
    return UIPokemonListItem(
      pokemon: data,
    );
  }
}
