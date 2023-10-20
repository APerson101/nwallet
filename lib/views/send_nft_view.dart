import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nwallet/mainProvider/dashboard_provider.dart';

class SendNFTView extends ConsumerWidget {
  const SendNFTView({super.key, required this.nftInfo});
  final NFTBalanceType nftInfo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 65)),
            child: const Text("Send"),
          ),
        )
      ],
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "ID: ${nftInfo.identifier}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),

        // receiver
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter Receiver',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
      ]),
    );
  }
}
