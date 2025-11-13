import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xuiter/app/app_viewmodel.dart';
import 'package:xuiter/app/bottom_navigator/bottom_navigator_view.dart';
import 'package:xuiter/app/feed/feed_view.dart';
import 'package:xuiter/app/messages/messages_view.dart';
import 'package:xuiter/app/notifications/notifications_view.dart';
import 'package:xuiter/app/search/search_view.dart';
import 'package:xuiter/app/vertical_navigator/vertical_navigator_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AppViewModel>();

    final List<Widget> pages = [
      const FeedView(),
      const SearchView(),
      const NotificationsView(),
      const MessagesView(),
    ];

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: const VerticalNavigatorView(),
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 190, 190, 190),
        ),
        title: const Text(
          'Xuiter',
          style: TextStyle(
            color: Color.fromARGB(255, 190, 190, 190),
            fontSize: 18,
          ),
        ),
      ),
      body: IndexedStack(index: viewModel.currentIndex, children: pages),
      bottomNavigationBar: BottomNavigatorView(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
      ),
    );
  }
}
