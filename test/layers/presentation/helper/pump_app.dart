import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:posts_task/layers/domain/usecase/posts/posts_usecase.dart';
import 'package:posts_task/layers/presentation/pages/home_tabs/posts/posts_tab.dart';

class GetPostsUseCaseMock extends Mock implements PostsUseCase {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    PostsUseCase? mPostsUseCase,
  }) {
    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: mPostsUseCase ?? GetPostsUseCaseMock(),
          ),
        ],
        child: const MaterialApp(
          home: PostsTab(),
        ),
      ),
    );
  }
}
