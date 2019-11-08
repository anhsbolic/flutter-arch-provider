import 'package:flutter/material.dart';
import 'package:prac_arch_provider_filledstack/core/enums/viewstate.dart';
import 'package:prac_arch_provider_filledstack/locator.dart';
import 'package:prac_arch_provider_filledstack/ui/route_names.dart';
import 'package:prac_arch_provider_filledstack/ui/router.dart';
import 'package:prac_arch_provider_filledstack/ui/views/base_view.dart';
import 'package:prac_arch_provider_filledstack/ui/widgets/login_header.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/app_colors.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/login_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                controller: controller,
                validationMessage: model.errorMessage
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        locator<Router>().navigateTo(routeHome);
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
