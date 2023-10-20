import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nwallet/helper/helper.dart';
import 'package:nwallet/main.dart';
import 'package:nwallet/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'constants.dart';

part 'dashboard_provider.g.dart';

typedef NFTBalanceType = ({String name, String identifier});

@riverpod
Future<void> transferTokens(TransferTokensRef ref, String type, String? amount,
    String? nftID, String receiver, String senderWords, int? quantity) async {
  try {
    final client = ref.read(httpClientProvider);
    var response = await client.post(Uri.http(baseUrl, 'api/tokenTransfer'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'senderWords': senderWords,
          'receiver': receiver,
          'type': type,
          'amount': amount,
          'nftID': nftID,
          'quantity': quantity.toString()
        }));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    safePrint(decodedResponse);
  } catch (error) {
    safePrint(error);
  } finally {
    // client.close();
  }
}

@riverpod
Future<String> getEGLDBalance(GetEGLDBalanceRef ref) async {
  try {
    final client = ref.read(httpClientProvider);
    if (GetIt.I<Helper>().userAccount != null) {
      final address = GetIt.I<Helper>().userAccount!.publickey;

      var response =
          await client.get(Uri.http(baseUrl, '/egldbalance/$address'));
      var reduc = (int.parse(response.body.substring(1, 6)) / 1000).toString();

      return reduc;
    }
    return 'Addr';
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // print(decodedResponse);
  } catch (error) {
    safePrint(error);
    return '';
  }
}

@riverpod
Future<List<TransactionInfo>> getTransactions(GetTransactionsRef ref) async {
  final useraddr = GetIt.I<Helper>().userAccount?.publickey ?? "no key found";
  final userTxns = await Amplify.DataStore.query(
    TransactionInfo.classType,
    where: TransactionInfo.SENDER
        .eq(useraddr)
        .and(TransactionInfo.RECEIVER.eq(useraddr)),
  );
  return userTxns;
}

@riverpod
Future<void> createTicketNFT(
    CreateTicketNFTRef ref,
    int quantity,
    int value,
    String location,
    String date,
    List<XFile> uris,
    String description,
    String ticker,
    String nftname) async {
// save images to s3
  List<String> newuris = [];
  for (var file in uris) {
    await Amplify.Storage.uploadFile(
            localFile: AWSFile.fromPath(file.path),
            key: 'nfts/${file.name}.png')
        .result;

    final url =
        await Amplify.Storage.getUrl(key: 'nfts/${file.name}.png').result;
    newuris.add(url.url.toString());
    // keys.add(res.uploadedItem.key);
  }

  final client = ref.read(httpClientProvider);

  var response = await client.post(Uri.http(baseUrl, 'api/createstateenft'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'quantity': quantity.toString(),
        'value': value.toString(),
        'uris': newuris.join(','),
        'ticker': ticker,
        'name': nftname
      }));
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  await Amplify.DataStore.save(TicketNFT(
      tokenID: decodedResponse['estateID'],
      urls: newuris,
      location: location,
      quantity: quantity,
      description: description,
      value: value,
      name: nftname,
      date: date));
}

@riverpod
Future<void> createEstateNFT(
    CreateEstateNFTRef ref,
    int quantity,
    int value,
    String longitude,
    String latitude,
    List<XFile> uris,
    String description,
    String ticker,
    String nftname) async {
// save images to s3
  List<String> newuris = [];

  for (var file in uris) {
    await Amplify.Storage.uploadFile(
            localFile: AWSFile.fromPath(file.path),
            key: 'nfts/${file.name}.png')
        .result;

    final url =
        await Amplify.Storage.getUrl(key: 'nfts/${file.name}.png').result;
    newuris.add(url.url.toString());
  }

  final client = ref.read(httpClientProvider);

  var response = await client.post(Uri.http(baseUrl, 'api/createstateenft'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'quantity': quantity.toString(),
        'value': value.toString(),
        'uris': newuris.join(','),
        'ticker': ticker,
        'name': nftname
      }));
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  await Amplify.DataStore.save(RealEstateNFT(
      tokenID: decodedResponse['estateID'],
      urls: newuris,
      longitude: longitude,
      latutude: latitude,
      quantity: quantity,
      description: description,
      value: value,
      name: nftname));
}

@riverpod
Future<
    (
      List<TicketNFT>,
      List<RealEstateNFT>,
    )> searchForNFTS(SearchForNFTSRef ref, String searchTerm) async {
  if (searchTerm.isEmpty) {
    final allRealEstateNFTs =
        await Amplify.DataStore.query(RealEstateNFT.classType);
    final allTicketNFTS = await Amplify.DataStore.query(
      TicketNFT.classType,
    );
    return (
      allTicketNFTS,
      allRealEstateNFTs,
    );
  }
  final allRealEstateNFTs = await Amplify.DataStore.query(
      RealEstateNFT.classType,
      where: RealEstateNFT.NAME.contains(searchTerm));
  final allTicketNFTS = await Amplify.DataStore.query(TicketNFT.classType,
      where: RealEstateNFT.NAME.contains(searchTerm));
  return (
    allTicketNFTS,
    allRealEstateNFTs,
  );
}

@riverpod
Future<List<NFTBalanceType>> getNFTBalance(GetNFTBalanceRef ref) async {
  try {
    final client = ref.read(httpClientProvider);
    if (GetIt.I<Helper>().userAccount != null) {
      final address = GetIt.I<Helper>().userAccount!.publickey;
      var response =
          await client.get(Uri.http(baseUrl, '/nftbalance/$address'));
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      List<NFTBalanceType> all = [];
      for (var item in decodedResponse) {
        NFTBalanceType nft =
            (name: item['name'], identifier: item['identifier']);
        all.add(nft);
      }

      safePrint(all);
      return all;
    }
    return [];
  } catch (error) {
    safePrint(error);
    return [];
  }
}
