import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/string_ext.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_result/pokemon_search_result_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../../../../intl/translations/translation_keys.dart';

class PokemonSearchPageResult extends ConsumerWidget {
  const PokemonSearchPageResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(pokemonSearchViewModelProvider.notifier);
    final loadingToSearchListPair = ref.watch(pokemonSearchViewModelProvider
        .select((value) => Tuple2(value.showLoading, value.pokemon)));

    final showLoading = loadingToSearchListPair.item1;
    final pokemon = loadingToSearchListPair.item2;

    return PokemonSearchResultContent(
      showLoading: showLoading,
      pokemon: pokemon,
      searchTerm: viewModel.searchTerm,
      intentHandlerCallback: viewModel.onIntent,
      searchResultsPlaceholder: LocaleKeys.searchResultsAppearHere.tr,
      noResultsPlaceholder: LocaleKeys.noResultsFound.tr,
    );
  }
}
