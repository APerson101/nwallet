import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nwallet/mainProvider/dashboard_provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateNFTView extends ConsumerWidget {
  CreateNFTView({super.key});

  final _status = ["Real Estate", "Event Ticket"];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 65)),
              onPressed: () async {
                // show flush bar
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 3),
                  titleText: const Text(
                    "Creating NFT!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: "ShadowsIntoLightTwo"),
                  ),
                  messageText: const Text(
                    "NFTs would show up in the wallet and marketplace after being created!!",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: "ShadowsIntoLightTwo"),
                  ),
                ).show(context);

                if (ref.watch(selectedNFTPRovider) == "Event Ticket") {
                  await ref.watch(createTicketNFTProvider(
                    int.parse(ref.watch(nftQuantityProvider)),
                    int.parse(ref.watch(nftValueProvider)),
                    ref.watch(eventlocationProvider),
                    ref.watch(selectedDateProvider),
                    ref.watch(selectedImagesProvider)!,
                    ref.watch(nftDescProvider),
                    ref.watch(nftTickerProvider),
                    ref.watch(nftNameProvider),
                  ).future);
                } else {
                  ref.watch(createEstateNFTProvider(
                    int.parse(ref.watch(nftQuantityProvider)),
                    int.parse(ref.watch(nftValueProvider)),
                    ref.watch(longitudeProvider),
                    ref.watch(latitudeProvider),
                    ref.watch(selectedImagesProvider)!,
                    ref.watch(nftDescProvider),
                    ref.watch(nftTickerProvider),
                    ref.watch(nftNameProvider),
                  ).future);
                }
              },
              child: const Text("Create NFTs")),
        )
      ],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RadioGroup<String>.builder(
              groupValue: ref.watch(selectedNFTPRovider),
              onChanged: (value) =>
                  ref.watch(selectedNFTPRovider.notifier).state = value!,
              items: _status,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (name) {
                    ref.watch(nftNameProvider.notifier).state = name;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter NFT name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (name) {
                    ref.watch(nftTickerProvider.notifier).state = name;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter NFt ticker",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  minLines: 5,
                  maxLines: 5,
                  onChanged: (desc) {
                    ref.watch(nftDescProvider.notifier).state = desc;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter NFt Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (quantity) {
                    print('new value is $quantity');
                    ref.watch(nftQuantityProvider.notifier).state = quantity;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter quantity",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    ref.watch(nftValueProvider.notifier).state = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter starting value",
                      suffixText: 'EGLD',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            ref.watch(selectedNFTPRovider) == "Event Ticket"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SfDateRangePicker(
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.single,
                      onSelectionChanged: (newDate) {
                        ref.watch(selectedDateProvider.notifier).state =
                            newDate.value.toString();
                      },
                    ))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ref.watch(longitudeProvider.notifier).state = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter longitude",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
            ref.watch(selectedNFTPRovider) == "Event Ticket"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        ref.watch(eventlocationProvider.notifier).state = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Location",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ref.watch(latitudeProvider.notifier).state = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter latitude",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
            ref.watch(selectedImagesProvider) == null
                ? ElevatedButton(
                    onPressed: () async {
                      ref.watch(selectedImagesProvider.notifier).state =
                          await ImagePicker().pickMultiImage();
                    },
                    child: const Text("Select images(s)"))
                : SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                        child: Expanded(
                      child: Row(
                          children: ref
                              .watch(selectedImagesProvider)!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                        height: 100, width: 100, File(e.path)),
                                  ))
                              .toList()),
                    )),
                  )
          ],
        ),
      ),
    );
  }
}

final selectedNFTPRovider = StateProvider((ref) => "Event Ticket");
final nftNameProvider = StateProvider((ref) => "");
final nftDescProvider = StateProvider((ref) => "");
final nftTickerProvider = StateProvider((ref) => "");
final selectedImagesProvider = StateProvider<List<XFile>?>((ref) => null);
final nftQuantityProvider = StateProvider((ref) => "");
final nftValueProvider = StateProvider((ref) => "");
final longitudeProvider = StateProvider((ref) => "");
final latitudeProvider = StateProvider((ref) => "");
final eventlocationProvider = StateProvider((ref) => "");
final selectedDateProvider = StateProvider((ref) => "");
