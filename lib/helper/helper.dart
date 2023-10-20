import 'package:nwallet/models/ModelProvider.dart';

class Helper {
  UserAccount? userAccount;
  bool? isAdmin;

  setAccount(UserAccount acc) {
    userAccount = acc;
  }
}
