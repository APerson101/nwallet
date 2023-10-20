import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyNFTView extends ConsumerWidget {
  const BuyNFTView({super.key, required this.tokenID, required this.cost});
  final String tokenID;
  final String cost;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // buy nft
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 65)),
              child: const Text("Confirm purchase"),
            ),
          )
        ],
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tokenID,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                cost,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
        ));
  }
}
