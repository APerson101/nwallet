import 'dart:convert';

import 'package:http/http.dart' as http;

const baseurl = '192.168.1.67:3000';
const url2 = 'localhost:3000/api';
void main() async {
  //

  final client = http.Client();
  String mainAddress =
      "erd1dhj6pu5l92wxvft2zmlpkcnm2xny9c4d728amgy9zjcrnh3du9esjxg6kc";
  String buyerWords =
      'museum reform lake position patch country win cliff coach hungry tiny employ refuse raccoon aisle present mean express trigger favorite embrace ice outer napkin';
  String buyerAddress =
      'erd14u2knvn5kqqmdfd8kl9kh4wn2xc6h549ty22l8efe4u8hmflaktscna3xq';
  String mainWords =
      'sure process axis chunk casual fatal social raven bonus jacket garden shift strike popular kiss celery actress acid success square flash sing now across';
  await createNewAccount(client);
  // await getEGLDBalance(client, mainAddress);
  // await getEGLDBalance(client, buyerAddress);
// create NFT
  // final nftID = await createNFT(client, 2, 30, ['a', 'b'], 'LOLA', 'Lolade');
  await getNFTBalance(client, mainAddress);
  await getNFTBalance(client, buyerAddress);

  // const nftID = "ERE-73a14b";

  // // buy NFT: Transfer egld to acc
  // await transferTokens(
  //     client, 'egld', 1.0.toString(), nftID, mainAddress, buyerWords, 0);

  // // Tranfer NFT to receiver
  await transferTokens(
      client, 'nft', null, 'LOLA-717647-02', buyerAddress, mainWords, 0);

  // confirm by getting balances for both

  // print("BALANCES AFTER TRANSACTION");

  // await getEGLDBalance(client, mainAddress);
  // await getEGLDBalance(client, buyerAddress);

  await getNFTBalance(client, mainAddress);
  await getNFTBalance(client, buyerAddress);

  // await verifyAccount(client, 'hello world');
}

createNFT(http.Client client, int quantity, int value, List<String> uris,
    String ticker, String name) async {
  var response = await client.post(Uri.http(baseurl, 'api/createstateenft'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'quantity': quantity.toString(),
        'value': value.toString(),
        'uris': uris.join(','),
        'ticker': ticker,
        'name': name
      }));
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  print(decodedResponse);
}

transferTokens(http.Client client, String type, String? amount, String? nftID,
    String receiver, String senderWords, int? quantity) async {
  try {
    var response = await client.post(Uri.http(baseurl, 'api/tokenTransfer'),
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
    print(decodedResponse);
  } catch (error) {
    print(error);
  } finally {
    // client.close();
  }
}

getEGLDBalance(http.Client client, String address) async {
  try {
    var response = await client.get(Uri.http(baseurl, '/egldbalance/$address'));
    print(response.body);
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // print(decodedResponse);
  } catch (error) {
    print(error);
  } finally {
    // client.close();
  }
}

getNFTBalance(http.Client client, String address) async {
  try {
    var response = await client.get(Uri.http(baseurl, '/nftbalance/$address'));
    print(response.body);
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // print(decodedResponse);
  } catch (error) {
    print(error);
  } finally {
    // client.close();
  }
}

createNewAccount(http.Client client) async {
  try {
    var response = await client.post(Uri.http(baseurl, '/api/createAccount'));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);
    // print(decodedResponse);
  } catch (error) {
    print(error);
  } finally {
    // client.close();
  }
}

verifyAccount(http.Client client, String words) async {
  try {
    var response = await client
        .post(Uri.http(baseurl, '/api/getAccount'), body: {'words': words});
    print(response.body);
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // print(decodedResponse);
  } catch (error) {
    print(error);
  } finally {
    // client.close();
  }
}
