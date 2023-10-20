import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveView extends ConsumerWidget {
  const ReceiveView({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: address),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: const Text("Copy Address"),
              subtitle: Text(address),
              trailing: IconButton(
                  onPressed: () async {
                    Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 3),
                      titleText: const Text(
                        "Copy!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "ShadowsIntoLightTwo"),
                      ),
                      messageText: const Text(
                        "Address copied to clipboard",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: "ShadowsIntoLightTwo"),
                      ),
                    ).show(context);
                    await Clipboard.setData(ClipboardData(text: address));
                  },
                  icon: const Icon(Icons.copy)),
            )
          ],
        ),
      ),
    );
  }
}
