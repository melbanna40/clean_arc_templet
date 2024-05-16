import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/debouncer.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/controller/posts_cubit.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/feed_widget.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({super.key});

  @override
  State<PostsTab> createState() => PostsTabState();
}

class PostsTabState extends State<PostsTab> {
  final _scrollController = ScrollController();
  final debounce = Debounce(milliseconds: 100);
  int page = 1;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.95)) {
      debounce.run(() {
        context.read<PostsCubit>().getPosts({'page': ++page, 'limit': 8});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostsStates.init:
            case PostsStates.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostsStates.success:
              return RefreshIndicator(
                onRefresh: () async {
                  await context
                      .read<PostsCubit>()
                      .getPosts({'page': 1, 'limit': 8});
                },
                child: ListView.builder(
                  key: const ValueKey('posts_page_list_key'),
                  controller: _scrollController,
                  itemCount: state.hasReachedMax
                      ? state.data?.length
                      : state.data!.length + 1,
                  itemBuilder: (context, index) => index >= state.data!.length
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : FeedListItem(
                          data: state.data![index]!,
                        ),
                ),
              );
            case PostsStates.failed:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('failed'),
                    InkWell(
                      onTap: () => context.read<PostsCubit>()
                        ..getPosts({'page': 1, 'limit': 8}),
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
