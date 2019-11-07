import 'dart:async';

import 'package:prac_arch_provider_filledstack/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

class AuthServices {

  // Inject Api
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}