import 'package:flutter/widgets.dart';
import 'package:flutter_template/presentation/base/exceptions/unhandled_effect_exception.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/base/widgets/snackbar/snackbar.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_body/pokemon_search_page_body.dart';
import 'package:flutter_template/presentation/entity/effect/effect.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';

class PokemonSearchPage extends StatelessWidget {
  final PokemonSearchScreen searchScreen;

  const PokemonSearchPage({
    Key? key,
    required this.searchScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<PokemonSearchScreen, PokemonSearchScreenState,
        PokemonSearchViewModel>(
      hideDefaultLoading: true,
      viewModelProvider: pokemonSearchViewModelProvider,
      screen: searchScreen,
      onAppBarBackPressed: (viewmodel) =>
          {viewmodel.onIntent(PokemonSearchScreenIntent.back())},
      body: const PokemonSearchPageBody(),
      onEffect: _handleEffect,
    );
  }

  _handleEffect(Effect effect) {
    effect.maybeMap(
      snackBar: (snackbarEffect) {
        showSnackbar(snackbarEffect);
      },
      orElse: () => throw UnhandledEffectException(effect),
    );
  }
}
