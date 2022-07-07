import 'package:flutter_template/repository/pokemon/domain_pokemon_mapper.dart';
import 'package:flutter_template/repository/pokemon/local_pokemon_mapper.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository.dart';
import 'package:flutter_template/repository/pokemon/pokemon_repository_impl.dart';
import 'package:flutter_template/services/pokemon/local/pokemon_local_service.dart';
import 'package:flutter_template/services/pokemon/remote/pokemon_remote_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';
import '../../test_models/pokemon/localCompanionPokemon.dart';
import '../../test_models/pokemon/localPokemon.dart';
import '../../test_models/pokemon/remotePokemon.dart';
import '../../test_models/pokemon/uiPokemon.dart';

void main() {
  late PokemonLocalService pokemonLocalService;
  late PokemonRemoteService pokemonRemoteService;
  late DomainPokemonMapper domainPokemonMapper;
  late LocalPokemonMapper localPokemonMapper;

  late PokemonRepository pokemonRepository;

  setUp(() {
    pokemonLocalService = MockPokemonLocalService();
    pokemonRemoteService = MockPokemonRemoteService();
    domainPokemonMapper = MockDomainPokemonMapper();
    localPokemonMapper = MockLocalPokemonMapper();

    pokemonRepository = PokemonRepositoryImpl(
      pokemonRemoteService: pokemonRemoteService,
      pokemonLocalService: pokemonLocalService,
      domainPokemonMapper: domainPokemonMapper,
      localPokemonMapper: localPokemonMapper,
    );
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
    "Given a string , when getSavedPokemons is called ,then local database will return pokemon details and no api call will be made",
    () async {
      //Given
      const searchTerm = "pikachu";
      final pokemonLocal = localPokemon;
      final pokemonUi = uiPokemon;
      const pokemonLocalCompanion = localCompanionPokemon;
      when(() => pokemonLocalService.getLocalPokemon(
            searchTerm: searchTerm,
          )).thenAnswer((_) => Future.value(pokemonLocal));
      when(() => domainPokemonMapper.mapLocalPokemon(pokemonLocal))
          .thenReturn(pokemonUi);

      //When
      final result = await pokemonRepository.getSavedPokemons(
        searchTerm: searchTerm,
      );

      //Then
      verify(() => pokemonLocalService.getLocalPokemon(searchTerm: searchTerm))
          .called(1);
      verifyNever(() => pokemonLocalService.savePokemonDetails(
          pokemon: pokemonLocalCompanion));
      verifyNever(
          () => pokemonRemoteService.searchPokemon(searchTerm: searchTerm));
      expect(result, uiPokemon);
    },
  );

  test(
    "Given a string , when getSavedPokemons is called ,then local database will return null and api call will be made",
    () async {
      //Given
      const searchTerm = "pikachu";
      final pokemonRemote = remotePokemon;
      final pokemonUi = uiPokemon;
      const pokemonLocalCompanion = localCompanionPokemon;
      when(() => pokemonLocalService.getLocalPokemon(
            searchTerm: searchTerm,
          )).thenAnswer((_) => Future.value(null));

      when(() => pokemonRemoteService.searchPokemon(searchTerm: searchTerm))
          .thenAnswer((_) => Future.value(pokemonRemote));

      when(() => domainPokemonMapper.map(pokemonRemote)).thenReturn(pokemonUi);

      when(() => pokemonLocalService.savePokemonDetails(
          pokemon: pokemonLocalCompanion)).thenAnswer((_) => Future.value());

      when(() => localPokemonMapper.map(uiPokemon))
          .thenReturn(localCompanionPokemon);

      //When
      final result = await pokemonRepository.getSavedPokemons(
        searchTerm: searchTerm,
      );

      //Then
      verify(() => pokemonLocalService.getLocalPokemon(searchTerm: searchTerm))
          .called(1);
      verify(() => pokemonLocalService.savePokemonDetails(
          pokemon: pokemonLocalCompanion)).called(1);
      verify(() => pokemonRemoteService.searchPokemon(searchTerm: searchTerm))
          .called(1);
      expect(result, uiPokemon);
    },
  );

  test(
    "Given a string , when getSavedPokemons is called ,then local database will return pokemon details fetched before 3 hrs and no api call will be made to get latest details.",
    () async {
      //Given
      const searchTerm = "pikachu";
      final pokemonLocal = oldLocalPokemon;
      final pokemonRemote = remotePokemon;
      final pokemonUi = uiPokemon;
      const pokemonLocalCompanion = localCompanionPokemon;
      when(() => pokemonLocalService.getLocalPokemon(
            searchTerm: searchTerm,
          )).thenAnswer((_) => Future.value(pokemonLocal));
      when(() => pokemonRemoteService.searchPokemon(searchTerm: searchTerm))
          .thenAnswer((_) => Future.value(pokemonRemote));
      when(() => domainPokemonMapper.map(pokemonRemote)).thenReturn(pokemonUi);
      when(() => pokemonLocalService.savePokemonDetails(
          pokemon: pokemonLocalCompanion)).thenAnswer((_) => Future.value());
      when(() => localPokemonMapper.map(uiPokemon))
          .thenReturn(localCompanionPokemon);

      //When
      final result = await pokemonRepository.getSavedPokemons(
        searchTerm: searchTerm,
      );

      //Then
      verify(() => pokemonLocalService.getLocalPokemon(searchTerm: searchTerm))
          .called(1);
      verify(() => pokemonLocalService.savePokemonDetails(
          pokemon: pokemonLocalCompanion)).called(1);
      verify(() => pokemonRemoteService.searchPokemon(searchTerm: searchTerm))
          .called(1);
      expect(result, uiPokemon);
    },
  );
}
