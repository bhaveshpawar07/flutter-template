import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_page.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/list/ui_pokemon_list_item.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_loading_shimmer/pokemon_search_page_loading_shimmer.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_template/presentation/intl/translations/translations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/viewmodels/fake_pokemon_search_view_model.dart';
import '../../../../../test_models/pokemon/uiPokemon.dart';
import '../../../../base/test_helpers.dart';
import '../../../../base/widget_tester_ext.dart';

void main() {
  late FakePokemonSearchViewModel fakePokemonSearchViewModel;

  var fakePokemonSearchViewModelProvider = StateNotifierProvider.autoDispose<
      PokemonSearchViewModel, PokemonSearchScreenState>((ref) {
    fakePokemonSearchViewModel =
        FakePokemonSearchViewModel(PokemonSearchScreenState(
      toolbar: UIToolbar(
        title: LocaleKeys.searchPageTitle,
        hasBackButton: true,
      ),
      showLoading: false,
      pokemon: null,
    ));
    return fakePokemonSearchViewModel;
  });

  setUpAll(baseSetupAll);

  setUp(() {});

  tearDown(() {
    GetIt.instance.reset();
    resetMocktailState();
  });

  _loadPageForGolden(WidgetTester tester) async {
    await tester.loadPageForGolden(
      page: const PokemonSearchPage(searchScreen: PokemonSearchScreen()),
      viewModelProvider: pokemonSearchViewModelProvider,
      fakeViewModelProvider: fakePokemonSearchViewModelProvider,
    );
  }

  testPageGolden(
    "Given search page is opened, When no other action is taken, Then text field ,search results text and search button should be present",
    goldenName: "pokemon_search_page_default_state",
    test: (tester) async {
      // Given
      await _loadPageForGolden(tester);

      // Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsOneWidget);
      expect(find.byType(PokemonSearchPageLoadingShimmer), findsNothing);
    },
  );

  testPageGolden(
    "Given search page is opened, When showLoading is true, Then ShimmerLoading should be visible",
    goldenName: "pokemon_search_page_shimmer",
    customPump: (tester) => tester.pump(),
    test: (tester) async {
      //Given
      await _loadPageForGolden(tester);

      //When
      fakePokemonSearchViewModel.setState((state) => state.copyWith(
            showLoading: true,
          ));
      await tester.pump();

      //Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsNothing);
      expect(find.byType(PokemonSearchPageLoadingShimmer), findsOneWidget);
    },
  );

  testPageGolden(
    "Given search results are not empty, When non empty search term is present, Then results should be displayed",
    goldenName: "pokemon_search_result",
    test: (tester) async {
      //Given
      await _loadPageForGolden(tester);
      //When
      fakePokemonSearchViewModel.setState((state) => state.copyWith(
            showLoading: false,
            pokemon: uiPokemon,
          ));
      await tester.pumpAndSettle();
      //Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsNothing);
      expect(find.byType(PokemonSearchPageLoadingShimmer), findsNothing);
      expect(find.byType(UIPokemonListItem), findsNWidgets(1));
    },
  );
}
