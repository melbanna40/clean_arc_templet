import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_task/core/di/injector.dart';
import 'package:posts_task/layers/domain/usecase/posts/posts_usecase.dart';
import 'package:posts_task/layers/presentation/pages/home_tabs/posts/controller/posts_cubit.dart';
import 'package:posts_task/layers/presentation/pages/home_tabs/posts/posts_tab.dart';
import 'package:posts_task/layers/presentation/pages/home_tabs/posts/widgets/feed_widget.dart';

import '../../../fixtures/fixtures.dart';
import '../helper/pump_app.dart';

class CharacterPageCubitMock extends MockCubit<PostsState>
    implements PostsCubit {}

void main() {
  group('PostsTab', () {
    final mGetPostsUseCaseMock = GetPostsUseCaseMock();
    final cubit = CharacterPageCubitMock();

    setUp(() async {
      await getIt.reset();
      getIt
        ..registerFactory(
          () => PostsUseCase(
            repository: getIt(),
          ),
        )
        ..registerFactory(
          () => PostsCubit(getIt()),
        );

      when(
        () => mGetPostsUseCaseMock.call({}),
      ).thenAnswer((_) async => postsList.call());
    });
    when(
      () => mGetPostsUseCaseMock.call({}),
    ).thenAnswer((_) async => postsList.call());

    testWidgets('renders a list of Characters widgets', (tester) async {
      const key = Key('posts_page_list_key');
      when(() => cubit.state).thenReturn(
        PostsState(
          status: PostsStates.success,
          hasReachedMax: true,
          data: [...posts],
        ),
      );
      when(() => cubit.getPosts({})).thenAnswer((_) async => true);

      await tester.pumpApp(
        BlocProvider.value(
          value: cubit,
          child: const PostsTab(),
        ),
        mPostsUseCase: mGetPostsUseCaseMock,
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(key), findsOneWidget);
      final list = [...posts, ...posts];
      await expectLater(find.byType(FeedListItem), findsNWidgets(list.length));
    });
  });
}
