import 'package:prac_arch_provider_filledstack/core/enums/viewstate.dart';
import 'package:prac_arch_provider_filledstack/core/services/auth_services.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/base_model.dart';
import 'package:prac_arch_provider_filledstack/locator.dart';

class LoginModel extends BaseModel {

  final AuthServices _authServices = locator<AuthServices>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = 'Vlue entered is not number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authServices.login(userId);
    setState(ViewState.Idle);
    return success;
  }


}