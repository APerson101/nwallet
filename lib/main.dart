import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:nwallet/helper/helper.dart';
import 'package:nwallet/models/ModelProvider.dart';
import 'package:nwallet/views/views.dart';

import 'mainProvider/auth_provider.dart';

void main() async {
  runApp(const ProviderScope(child: _Loader()));
  GetIt.I.registerSingleton(Helper());

  runApp(const ProviderScope(child: MainApp()));
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
            home: ref.watch(loadCurrentUserProvider).when(data: (auth) {
              return ref.watch(loadUserAccountProvider(auth.userId)).when(
                  data: (data) {
                if (GetIt.I<Helper>().userAccount == null) {
                  GetIt.I<Helper>().setAccount(data);
                }
                if (auth.username == "qq") {
                  GetIt.I<Helper>().isAdmin = true;
                }
                return MainHomeView(userAccount: data);
              }, error: (er, st) {
                debugPrintStack(stackTrace: st);
                return const Center(
                    child: Text("Failed to load account details"));
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              });
            }, error: (er, st) {
              debugPrintStack(stackTrace: st);
              return const Center(child: Text("Failed to current user"));
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            })));
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
        onTap: (selected) {
          ref.watch(_currentIndexProvider.notifier).state = selected;
        },
        items: _NavBarItems.values
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList());
  }
}

class MainHomeView extends ConsumerWidget {
  const MainHomeView({super.key, required this.userAccount});
  final UserAccount userAccount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: switch (ref.watch(_currentIndexProvider)) {
        0 => const DashboardView(),
        1 => const SearchView(),
        _ => const Center(child: Text("What are we doing here"))
      },
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

enum _NavBarItems {
  dashboard('Dashboard', Icons.dashboard),
  search("Search", Icons.search);

  final String label;
  final IconData icon;

  const _NavBarItems(this.label, this.icon);
}

final _currentIndexProvider = StateProvider((ref) => 0);
final httpClientProvider = Provider((ref) => http.Client());
