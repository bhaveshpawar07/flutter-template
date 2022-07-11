import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/pokemon/search/widgets/search_page_body/pokemon_search_page_body_content.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../base/widget_tester_ext.dart';

void main() {
  late TextEditingController textEditingController;
  // late MockIntentHandler intentHandler;
  late MockVoidCallback callback;
  setUp(() {
    textEditingController = TextEditingController();
    // intentHandler = MockIntentHandler();
    callback = MockVoidCallback();
  });

  tearDown(
    () => resetMocktailState(),
  );
  testWidgets(
    "Given searchHint Text, When search page body content is loaded, Then hint should be displayed on text field",
    (tester) async {
      //Given
      const searchHint = "searchHint";
      //When
      await tester.loadWidget(
          widget: PokemonSearchBodyContent(
              textController: textEditingController,
              searchHint: searchHint,
              apiCall: () {},
              child: Container()));
      await tester.pump();
      //Then

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(searchHint), findsOneWidget);
    },
  );

  testWidgets(
      "Given search page body content is loaded, When text is entered in text field, Then text editing controlled should be updated",
      (WidgetTester tester) async {
    // Given
    const searchHint = "searchHint";
    const searchText = "searchText";

    // When
    await tester.loadWidget(
      widget: PokemonSearchBodyContent(
          textController: textEditingController,
          searchHint: searchHint,
          apiCall: () {},
          child: Container()),
    );
    await tester.pump();
    await tester.enterText(find.byType(TextField), searchText);
    await tester.pumpAndSettle();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text(searchHint), findsOneWidget);
    expect(find.text(searchText), findsOneWidget);
    expect(textEditingController.value.text, searchText);
  });

  testWidgets(
      "Given search page body content is loaded, When search is clicked, Then search method is called with the textcontroller text",
      (WidgetTester tester) async {
    // Given
    const searchHint = "searchHint";
    const searchText = "searchText";
    // when(callback.callApi).thenReturn;

    // When
    await tester.loadWidget(
      widget: PokemonSearchBodyContent(
          textController: textEditingController,
          searchHint: searchHint,
          apiCall: () => callback.callApi(),
          child: Container()),
    );
    await tester.pump();
    await tester.enterText(find.byType(TextField), searchText);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Then
    verify(() => callback.callApi()).called(1);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text(searchHint), findsOneWidget);
    expect(find.text(searchText), findsOneWidget);
    expect(textEditingController.value.text, searchText);
  });
}
