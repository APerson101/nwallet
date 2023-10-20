import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nwallet/mainProvider/dashboard_provider.dart';

import '../models/ModelProvider.dart';
import 'buy_nft_view.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: 'Search for events or real estate assets',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                onFieldSubmitted: (searchKey) async {
                  ref.watch(_isSearchingProvider.notifier).state = true;
                  ref.watch(_searchTermProvider.notifier).state = searchKey;
                  await ref.watch(
                      searchForNFTSProvider(ref.watch(_searchTermProvider))
                          .future);
                },
              ),
            ),
            const SizedBox(height: 20),
            ref
                .watch(searchForNFTSProvider(ref.watch(_searchTermProvider)))
                .when(
                    data: (data) {
                      return _SearchResultView(
                          estates: data.$2, tickets: data.$1);
                    },
                    error: (er, st) {
                      debugPrintStack(stackTrace: st);
                      return const Center(
                        child: Text("Failed to load result"),
                      );
                    },
                    loading: () => const CircularProgressIndicator.adaptive())
          ],
        ),
      ),
    );
  }
}

class _SearchResultView extends ConsumerWidget {
  const _SearchResultView({required this.estates, required this.tickets});
  final List<RealEstateNFT> estates;
  final List<TicketNFT> tickets;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .55,
        child: Scaffold(
            appBar: AppBar(
                bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.event)),
              Tab(icon: Icon(Icons.house)),
            ])),
            body: TabBarView(children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                  child: Column(
                      children: tickets
                          .map((e) => ExpansionTile(
                                leading: Text(e.value.toString()),
                                title: Text(e.name),
                                subtitle: Text(e.location),
                                trailing: Text(e.createdAt
                                        ?.getDateTimeInUtc()
                                        .toString() ??
                                    e.date),
                                children: [
                                  SizedBox(
                                      height: 100,
                                      child: SingleChildScrollView(
                                          child: Row(
                                        children: e.urls
                                            .map((f) =>
                                                Image.network(f, height: 65))
                                            .toList(),
                                      ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return BuyNFTView(
                                              tokenID: e.tokenID,
                                              cost: e.value.toString());
                                        }));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          minimumSize:
                                              const Size(double.infinity, 65)),
                                      child: const Text("Buy now"),
                                    ),
                                  )
                                ],
                              ))
                          .toList()),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    children: estates
                        .map((e) => ExpansionTile(
                              leading: Text(e.value.toString()),
                              title: Text(e.name),
                              subtitle: Text(e.quantity.toString()),
                              trailing: const Text("Real Estate"),
                              children: [
                                SizedBox(
                                    height: 100,
                                    child: SingleChildScrollView(
                                        child: Row(
                                      children: e.urls
                                          .map((f) =>
                                              Image.network(f, height: 65))
                                          .toList(),
                                    ))),
                                ListTile(
                                  title: const Text("date added"),
                                  subtitle: Text(e.createdAt?.format() ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return BuyNFTView(
                                            tokenID: e.tokenID,
                                            cost: e.value.toString());
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 65)),
                                    child: const Text("Buy now"),
                                  ),
                                )
                              ],
                            ))
                        .toList()),
              ),
            ])),
      ),
    );
  }
}

final _isSearchingProvider = StateProvider((ref) => false);
final _searchTermProvider = StateProvider((ref) => '');
