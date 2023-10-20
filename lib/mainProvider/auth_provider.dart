import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:nwallet/amplifyconfiguration.dart';
import 'package:nwallet/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../main.dart';
import 'constants.dart';

part 'auth_provider.g.dart';

@riverpod
Future<void> loadConfig(LoadConfigRef ref) async {
  await Amplify.addPlugin(AmplifyAuthCognito());
  await Amplify.addPlugin(
      AmplifyDataStore(modelProvider: ModelProvider.instance));
  await Amplify.addPlugin(AmplifyStorageS3());
  await Amplify.configure(amplifyconfig);
  // await Amplify.DataStore.clear();
}

@riverpod
Future<AuthUser> loadCurrentUser(LoadCurrentUserRef ref) async {
  var user = await Amplify.Auth.getCurrentUser();

  safePrint(user.userId);
  return user;
}

@riverpod
Future<UserAccount> loadUserAccount(LoadUserAccountRef ref, String id) async {
  final user = await Amplify.DataStore.query(UserAccount.classType,
      where: UserAccount.ID.eq(id),
      pagination: const QueryPagination(page: 0, limit: 1));
  if (user.isNotEmpty) {
    return user[0];
  } else {
    var user = await ref.watch(createEGLDAccountProvider(id).future);
    return user;
  }
}

@riverpod
Future<UserAccount> createEGLDAccount(
    CreateEGLDAccountRef ref, String id) async {
  safePrint('$baseUrl/api/createAccount');
  final client = ref.read(httpClientProvider);
  var response = await client.post(Uri.http(baseUrl, '/api/createAccount'));
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  safePrint(decodedResponse);
  final newUser = UserAccount(
      id: id,
      publickey: decodedResponse['address'],
      firstName: "John",
      lastName: "Doe",
      privatekey: decodedResponse['words']);
  await Amplify.DataStore.save(newUser);

  return newUser;
}
