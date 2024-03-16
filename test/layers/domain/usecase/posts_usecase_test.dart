import 'package:integration_test/common.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_task/layers/domain/models/posts_model.dart';
import 'package:posts_task/layers/domain/repository/app_repository.dart';
import 'package:posts_task/layers/domain/usecase/posts/posts_usecase.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixtures.dart';

class MockCharacterRepository extends Mock implements AppRepository {}

void main() {
  late PostsUseCase getPostsData;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getPostsData = PostsUseCase(repository: mockCharacterRepository);
  });

  group('PostsUseCase', () {
    test('call should return a list of Posts', () async {
      final postsListData = posts;
      when(() => mockCharacterRepository.getPostsData({}))
          .thenAnswer((_) async => postsList());

      final result = await getPostsData.call({'page': 1, 'limit': 8});

      result.fold((left) => expect(result, isA<Failure>()), (right) {
        expect(result, isA<List<Posts>>());
        expect(right, equals(postsListData));
        verify(() => mockCharacterRepository.getPostsData({})).called(1);
        verifyNoMoreInteractions(mockCharacterRepository);
      });
    });
  });
}
