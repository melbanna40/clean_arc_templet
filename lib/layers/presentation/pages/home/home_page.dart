import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/di/injector.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/messages/messages_tab.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/notifications/notifications_tab.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/controller/posts_cubit.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/posts_tab.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final tabs = [
    const PostsTab(),
    const NotificationsTab(),
    const MessagesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              elevation: 4,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                'Posts App!',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms, color: const Color(0xFF80DDFF))
                  .animate() // this wraps the previous Animate in another Animate
                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                  .slide(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        key: const Key('bottomNavigationBar'),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            key: Key('Posts'),
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Posts',
          ),
          NavigationDestination(
            key: Key('Tab2'),
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Tab2',
          ),
          NavigationDestination(
            key: Key('Tab3'),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Tab3',
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<PostsCubit>()..getPosts({'page': 1, 'limit': 8}),
          ),
        ],
        child: tabs.elementAt(currentPageIndex),
      ),
    );
  }
}
