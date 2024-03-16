import 'package:mocktail/mocktail.dart';
import 'package:posts_task/layers/data/app_repository_impl.dart';
import 'package:posts_task/layers/data/source/local/local_storage.dart';
import 'package:posts_task/layers/data/source/remote/app_api.dart';
import 'package:posts_task/layers/data/source/remote/network_info.dart';
 import 'package:posts_task/layers/domain/models/posts_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixtures.dart';

class MockApi extends Mock implements AppServiceClient {}

class MockLocalStorage extends Mock implements LocalStorage {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late AppRepositoryImpl characterRepository;
  late MockApi mockApi;
  late MockLocalStorage mockLocalStorage;
  late MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockApi = MockApi();
    mockLocalStorage = MockLocalStorage();
    mockNetworkInfo = MockNetworkInfo();
    characterRepository = AppRepositoryImpl(
      api: mockApi,
      localStorage: mockLocalStorage,
      networkInfo: mockNetworkInfo,
    );
  });

  group('AppRepositoryImpl', () {
    test('getCharacters should return cached characters if available',
        () async {
      final cachedCharacters = futurePostsList();
      when(() => mockLocalStorage.getPostsList()).thenReturn(cachedCharacters);

      final result =
          await characterRepository.getPostsData({'page': 1, 'limit': 8});

      expect(result, equals(cachedCharacters));

      verify(() => mockLocalStorage.getPostsList()).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test(
        'getCharacters should fetch characters from API and save to local storage',
        () async {
      const page = 1;
      final apiCharacters = futurePostsList();
      when(() => mockLocalStorage.getPostsList())
          .thenReturn(<Posts>[] as Future<List<Posts>?>);
      when(() => mockApi.getPostsApiCall({'page': 1, 'limit': 8}))
          .thenAnswer((_) async => futurePostsFromDtoList());

      final result =
          await characterRepository.getPostsData({'page': 1, 'limit': 8});

      expect(result, equals(apiCharacters));
      verify(() => mockLocalStorage.getPostsList()).called(1);
      verify(() => mockApi.getPostsApiCall({'page': 1, 'limit': 8})).called(1);

      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });
}
