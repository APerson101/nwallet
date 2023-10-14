import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nwallet/views/views.dart';

import 'mainProvider/auth_provider.dart';

void main() async {
  runApp(const _Loader());
  runApp(const MainApp());
}

class _Loader extends ConsumerWidget {
  const _Loader();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadConfigProvider).when(data: (_) {
      return const Center(child: MainApp());
    }, error: (er, st) {
      debugPrintStack(stackTrace: st);
      return const Center(child: Text("ERROR"));
    }, loading: () {
      return const Center(child: CircularProgressIndicator.adaptive());
    });
  }
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Authenticator(
        child: MaterialApp(
            builder: Authenticator.builder(),
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: switch (ref.watch(_currentIndexProvider)) {
                0 => const DashboardView(),
                1 => const SearchView(),
                2 => const NotificationsView(),
                3 => const ProfileView(),
                _ => const Center(child: Text("What are we doing here"))
              },
              bottomNavigationBar: const _BottomNavBar(),
            )));
  }
}

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: ref.watch(_currentIndexProvider),
        items: _NavBarItems.values
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList());
  }
}

enum _NavBarItems {
  dashboard('Dashboard', Icons.dashboard),
  search("Search", Icons.search),
  notifications("Notifications", Icons.notifications),
  profile("Profile", Icons.person);

  final String label;
  final IconData icon;

  const _NavBarItems(this.label, this.icon);
}

final _currentIndexProvider = StateProvider((ref) => 0);
