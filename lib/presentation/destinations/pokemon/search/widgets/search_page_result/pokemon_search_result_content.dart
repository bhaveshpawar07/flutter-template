import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/list/ui_pokemon_list_item.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_loading_shimmer/pokemon_search_page_loading_shimmer.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';

import '../../../../../base/intent/intent_handler_callback.dart';

class PokemonSearchResultContent extends StatelessWidget {
  final bool showLoading;
  // final List<UIListItem> searchList;
  final UIPokemon? pokemon;
  final String searchTerm;
  final IntentHandlerCallback<PokemonSearchScreenIntent> intentHandlerCallback;
  final String searchResultsPlaceholder;
  final String noResultsPlaceholder;

  const PokemonSearchResultContent({
    Key? key,
    required this.showLoading,
    required this.pokemon,
    required this.searchTerm,
    required this.intentHandlerCallback,
    required this.searchResultsPlaceholder,
    required this.noResultsPlaceholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showLoading && pokemon == null) {
      return Expanded(
        child: Center(
          child: searchTerm.isEmpty
              ? Text(searchResultsPlaceholder)
              : Text(noResultsPlaceholder),
        ),
      );
    }
    if (showLoading) {
      return const PokemonSearchPageLoadingShimmer();
    } else {
      return Expanded(
        child: SingleChildScrollView(
          child: UIPokemonListItem(pokemon: pokemon!),
        ),
        // child: ResponsiveBuilder(
        //     builder: (context, mediaQueryData, boxConstraints) {
        //   return UIList<PokemonSearchScreenIntent>(
        //     renderers: const {UIPokemon: UIPokemonRenderer()},
        //     intentHandler: intentHandlerCallback,
        //     items: searchList,
        //   );
        // }),
      );
    }
  }
}
