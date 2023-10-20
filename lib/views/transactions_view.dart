import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nwallet/mainProvider/dashboard_provider.dart';

//TODO: date, type, value, receiver, sender
class TransactionsView extends ConsumerWidget {
  const TransactionsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget children = ref.watch(getTransactionsProvider).when(
        data: (txns) {
          return SingleChildScrollView(
            child: Column(
                children: txns
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            // bro  ali
                            title: Text(e.type),
                            subtitle:
                                Text(e.createdAt?.format() ?? "2023-10-20"),
                            trailing: Text(
                              e.value,
                              style: TextStyle(
                                  color: int.parse(e.value) < 0
                                      ? Colors.red
                                      : Colors.green),
                            ),
                            children: [
                              ListTile(
                                title: const Text("sender"),
                                subtitle: Text(e.sender),
                              ),
                              ListTile(
                                title: const Text("receiver"),
                                subtitle: Text(e.receiver),
                              ),
                            ],
                          ),
                        ))
                    .toList()),
          );
        },
        error: (er, st) {
          debugPrintStack(stackTrace: st);
          return const Center(child: Text("Error"));
        },
        loading: () => const CircularProgressIndicator.adaptive());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: children,
    );
  }
}
