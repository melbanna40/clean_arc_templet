import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/layers/data/dto/posts_dto.dart';
import 'package:posts_app/layers/domain/usecase/posts/posts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.mPostsUseCase) : super(const PostsState());

  final PostsUseCase mPostsUseCase;

  Future<void> getPosts(Map<String, dynamic> params) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostsStates.init) {
        final result = await mPostsUseCase.call(params);

        result.fold((failure) {
          emit(state.copyWith(status: PostsStates.failed));
        }, (data) {
          if (data!.isNotEmpty) {
            emit(
              state.copyWith(
                status: PostsStates.success,
                data: data,
                hasReachedMax: data.length < 8,
              ),
            );
          } else {
            emit(state.copyWith(hasReachedMax: true));
          }
        });
      } else {
        final result = await mPostsUseCase.call(params);
        result.fold((failure) {}, (data) {
          if (data!.isNotEmpty) {
            emit(
              state.copyWith(
                status: PostsStates.success,
                data: List.of(state.data ?? [])..addAll(data),
                hasReachedMax: data.length < 8,
              ),
            );
          } else {
            emit(state.copyWith(hasReachedMax: true));
          }
        });
      }
    } catch (error, stack) {
      log('$error\n$stack');
      emit(state.copyWith(status: PostsStates.failed));
    }
  }
}
