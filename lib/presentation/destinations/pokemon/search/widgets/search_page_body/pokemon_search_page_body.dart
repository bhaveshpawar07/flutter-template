import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/foundation/extensions/string_ext.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_body/pokemon_search_page_body_content.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_result/pokemon_search_page_result.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PokemonSearchPageBody extends HookConsumerWidget {
  const PokemonSearchPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    callApi() {
      final viewModel = ref.read(pokemonSearchViewModelProvider.notifier);
      viewModel.onIntent(PokemonSearchScreenIntent.search(
        searchTerm: textController.text,
      ));
    }

    return PokemonSearchBodyContent(
      textController: textController,
      searchHint: LocaleKeys.startTypingToSearch.tr,
      apiCall: callApi,
      child: const PokemonSearchPageResult(),
    );
  }
}
