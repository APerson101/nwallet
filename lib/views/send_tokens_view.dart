import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SendView extends ConsumerWidget {
  const SendView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 40),
        // amount
        Text(
          'EGLD ${ref.watch(_enteredAmountProvider)}',
          style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 25),
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

        //keypad
        CustomKeyBoard(
          maxLength: 4,
          onChanged: (newValue) {
            ref.watch(_enteredAmountProvider.notifier).state = newValue;
          },
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: const Size(double.infinity, 60)),
            child: const Text("Send"),
          ),
        )
      ]),
    );
  }
}

final _enteredAmountProvider = StateProvider((ref) => '0.0');
