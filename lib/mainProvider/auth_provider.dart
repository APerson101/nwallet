import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:nwallet/amplifyconfiguration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Future<void> loadConfig(LoadConfigRef ref) async {
  await Amplify.addPlugin(AmplifyAuthCognito());
  await Amplify.configure(amplifyconfig);
}

@riverpod
Future<String?> loadCurrentUser(LoadCurrentUserRef ref) async {
  var user = await Amplify.Auth.getCurrentUser();
  return user.userId;
}
