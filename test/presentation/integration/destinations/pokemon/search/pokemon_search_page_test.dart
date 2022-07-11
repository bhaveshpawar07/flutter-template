import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_page.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/pokemon_search_view_model.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_loading_shimmer/pokemon_search_page_loading_shimmer.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocktail_network_image.dart';
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
      toolbar:
          UIToolbar(title: LocaleKeys.searchPageTitle, hasBackButton: true),
      showLoading: false,
      pokemon: null,
    ));
    return fakePokemonSearchViewModel;
  });

  setUpAll(baseSetupAll);

  setUp(() {
    // EasyLocalization.of(context)?.setLocale(Locale("en", "US"));
  });

  tearDown(() {
    GetIt.instance.reset();
    resetMocktailState();
  });

  _loadPage(WidgetTester tester) async {
    await tester.loadPage(
      widget: const PokemonSearchPage(
        searchScreen: PokemonSearchScreen(),
      ),
      viewModelProvider: pokemonSearchViewModelProvider,
      fakeViewModelProvider: fakePokemonSearchViewModelProvider,
    );
  }

  testWidgets(
      "Given search page is opened, When no other action is taken, Then text field, search results text and search button should be present",
      (tester) async {
    // Given
    await _loadPage(tester);

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(LocaleKeys.searchResultsAppearHere), findsOneWidget);
    expect(find.byType(PokemonSearchPageLoadingShimmer), findsNothing);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
      "Given search page is opened, When showLoading is true, Then ShimmerLoading should be visible",
      (tester) async {
    // Given
    await _loadPage(tester);

    // When
    fakePokemonSearchViewModel
        .setState((state) => state.copyWith(showLoading: true));
    await tester.pump();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(LocaleKeys.searchResultsAppearHere), findsNothing);
    expect(find.byType(PokemonSearchPageLoadingShimmer), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
      "Given search results are empty, When non empty search term is present, Then noResultsFound should be displayed",
      (tester) async {
    // Given
    await _loadPage(tester);

    // When
    fakePokemonSearchViewModel.setState(
        (state) => state.copyWith(showLoading: true, pokemon: uiPokemon));
    await tester.pump();
    fakePokemonSearchViewModel.updateSearchTerm("newTerm");
    fakePokemonSearchViewModel.setState((state) => state.copyWith(
          showLoading: false,
          pokemon: null,
        ));
    await tester.pump();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(LocaleKeys.searchResultsAppearHere), findsNothing);
    expect(find.byType(PokemonSearchPageLoadingShimmer), findsNothing);
    expect(find.text(LocaleKeys.noResultsFound), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
      "Given search results are not empty, When non empty search term is present, Then results should be displayed",
      (tester) async {
    await mockNetworkImagesSvg("svg", () async {
      // Given
      await _loadPage(tester);

      // When
      fakePokemonSearchViewModel.setState(
          (state) => state.copyWith(showLoading: false, pokemon: uiPokemon));
      await tester.pump();

      // Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(LocaleKeys.searchResultsAppearHere), findsNothing);
      expect(find.byType(PokemonSearchPageLoadingShimmer), findsNothing);
      expect(find.text(LocaleKeys.noResultsFound), findsNothing);

      // expect(find.byType(UIPokemonListItem), findsNWidgets(1));
    });
  });
  //
  // testWidgets(
  //     "Given search list is displayed, When a city is marked as favorite, Then the icon is in selected state",
  //     (tester) async {
  //   // Given
  //   await _loadPage(tester);
  //   final uiCityList = [
  //     UICity(
  //       cityId: 1,
  //       title: "title",
  //       locationType: "locationType",
  //       location: "location",
  //       isFavourite: true,
  //       state: '',
  //       displayTitle: '',
  //     ),
  //     UICity(
  //       cityId: 2,
  //       title: "title 2",
  //       locationType: "locationType 2",
  //       location: "location 2",
  //       isFavourite: false,
  //       state: '',
  //       displayTitle: '',
  //     ),
  //   ];
  //
  //   // When
  //   fakeSearchViewModel.setState(
  //       (state) => state.copyWith(showLoading: false, searchList: uiCityList));
  //   await tester.pump();
  //
  //   // Then
  //   expect(find.byIcon(Icons.favorite), findsOneWidget);
  // });
  //
  // testWidgets(
  //     "Given search page opened, When text is entered in text field, Then search intent is fired",
  //     (tester) async {
  //   // Given
  //   await _loadPage(tester);
  //
  //   // When
  //   await tester.enterText(find.byType(TextField), "search");
  //   await tester.pump();
  //
  //   // Then
  //   verify(() => fakeSearchViewModel
  //       .onIntent(SearchScreenIntent.search(searchTerm: "search"))).called(1);
  // });
  //
  testWidgets(
      "Given search page is opened, When back button is pressed, Then back intent is fired",
      (tester) async {
    // Given
    await _loadPage(tester);

    // When

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Then
    verify(() => fakePokemonSearchViewModel.onIntent(
        PokemonSearchScreenIntent.search(searchTerm: "searchTerm"))).called(1);
  });
  //
  // testWidgets(
  //     "Given search list is displayed, When favorite is pressed, Then favorite intent is fired",
  //     (tester) async {
  //   // Given
  //   await _loadPage(tester);
  //   final uiCityList = [
  //     UICity(
  //       cityId: 1,
  //       title: "title",
  //       locationType: "locationType",
  //       location: "location",
  //       isFavourite: false,
  //       displayTitle: '',
  //       state: '',
  //     ),
  //     UICity(
  //       cityId: 2,
  //       title: "title 2",
  //       locationType: "locationType 2",
  //       location: "location 2",
  //       isFavourite: false,
  //       displayTitle: '',
  //       state: '',
  //     ),
  //   ];
  //
  //   // When
  //   fakeSearchViewModel.setState(
  //       (state) => state.copyWith(showLoading: false, searchList: uiCityList));
  //   await tester.pump();
  //   await tester.tap(find
  //       .descendant(
  //           of: find.byType(UICityListItem), matching: find.byType(IconButton))
  //       .first);
  //   await tester.pump();
  //   await tester.tap(find
  //       .descendant(
  //           of: find.byType(UICityListItem), matching: find.byType(IconButton))
  //       .last);
  //   await tester.pump();
  //
  //   // Then
  //   verify(() => fakeSearchViewModel.onIntent(
  //       SearchScreenIntent.toggleFavorite(city: uiCityList.first))).called(1);
  //   verify(() => fakeSearchViewModel.onIntent(
  //       SearchScreenIntent.toggleFavorite(city: uiCityList.last))).called(1);
  // });
}
