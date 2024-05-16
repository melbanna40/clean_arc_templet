part of 'posts_cubit.dart';

enum PostsStates { init, loading, success, failed }

class PostsState extends Equatable {
  const PostsState({
    this.status = PostsStates.init,
    this.data = const [],
    this.hasReachedMax = false,
  });

  final PostsStates status;
  final List<PostsDataDto?>? data;
  final bool hasReachedMax;

  PostsState copyWith({
    PostsStates? status,
    List<PostsDataDto?>? data,
    bool? hasReachedMax,
  }) {
    return PostsState(
      status: status ?? this.status,
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        hasReachedMax,
      ];
}
