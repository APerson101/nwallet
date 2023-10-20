import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nwallet/helper/helper.dart';
import 'package:nwallet/mainProvider/dashboard_provider.dart';
import 'package:nwallet/views/receive_view.dart';
import 'package:nwallet/views/send_nft_view.dart';
import 'package:nwallet/views/send_tokens_view.dart';
import 'package:nwallet/views/transactions_view.dart';

import 'create_nft_view.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
        child: SizedBox.expand(
      child: Column(
        children: [
          Expanded(
              flex: 30,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: _BalanceWidget(),
              )),
          Expanded(
              flex: 15,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: _ButtonsWidget(),
              )),
          Expanded(
              flex: 55,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: _NftsWidget(),
              )),
        ],
      ),
    ));
  }
}

class _BalanceWidget extends ConsumerWidget {
  const _BalanceWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget balance = ref.watch(getEGLDBalanceProvider).when(
        data: (balance) => Text(
              "ELGD $balance",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
        error: (er, st) => const Text("ERROR"),
        loading: () => const CircularProgressIndicator.adaptive());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            trailing: IconButton(
                onPressed: () async {
                  await Amplify.Auth.signOut();
                },
                icon: const Icon(Icons.logout)),
            title: const Text(
              "Welcome",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 40),
          const Text("Balance"),
          const SizedBox(height: 20),
          balance,
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}

class _ButtonsWidget extends ConsumerWidget {
  const _ButtonsWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? isAdmin = GetIt.I<Helper>().isAdmin;
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 249, 236, 252)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SendView()));
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.purple,
                        )),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Send",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        isAdmin ?? false
            ? Expanded(
                child: Column(
                  children: [
                    DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 249, 236, 252)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateNFTView()));
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.purple,
                              )),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Create NFT",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            : Container(),
        Expanded(
          child: Column(
            children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 249, 236, 252)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ReceiveView(
                                address:
                                    GetIt.I<Helper>().userAccount?.publickey ??
                                        "key not found");
                          }));
                        },
                        icon: const Icon(
                          Icons.qr_code,
                          color: Colors.purple,
                        )),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Receive",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 249, 236, 252)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const TransactionsView();
                          }));
                        },
                        icon: const Icon(
                          Icons.history,
                          color: Colors.purple,
                        )),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Transactions",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _NftsWidget extends ConsumerWidget {
  const _NftsWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget nftsWidgets = ref.watch(getNFTBalanceProvider).when(
        data: (balances) {
          return SingleChildScrollView(
            child: Column(
              children: balances
                  .where(
                      (element) => element.name.contains('LockedMEX') == false)
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ExpansionTile(
                          leading: const Icon(Icons.person),
                          collapsedBackgroundColor:
                              const Color.fromARGB(255, 246, 240, 248),
                          title: Text(
                            e.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.deepPurple),
                          ),
                          subtitle: Text(
                            e.identifier,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          trailing: const Text(
                            "EGLD 40",
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                          children: [
                            const FlutterLogo(
                              size: 48,
                            ),
                            const ListTile(
                                title: Text("Longitude"),
                                subtitle: Text("0.86464")),
                            const ListTile(
                                title: Text("Latitude"),
                                subtitle: Text("0.86464")),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SendNFTView(nftInfo: e);
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 65)),
                              child: const Text("Send"),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          );
        },
        error: (er, st) => const Center(
              child: Text("ERROR"),
            ),
        loading: () => const CircularProgressIndicator.adaptive());
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Your nfts",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold)),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    ref.invalidate(getNFTBalanceProvider);
                    ref.invalidate(getEGLDBalanceProvider);
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),

          // all nfts
          Expanded(child: nftsWidgets)
        ],
      ),
    );
  }
}
