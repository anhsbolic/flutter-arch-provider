import 'package:flutter/material.dart';
import 'package:prac_arch_provider_filledstack/ui/route_names.dart';
import 'package:provider/provider.dart';
import 'package:prac_arch_provider_filledstack/core/models/user.dart';
import 'package:prac_arch_provider_filledstack/core/services/auth_services.dart';
import 'package:prac_arch_provider_filledstack/locator.dart';
import 'package:prac_arch_provider_filledstack/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthServices>().userController,
      child: MaterialApp(
        title: 'Provider Arch Demo',
        theme: ThemeData(),
        initialRoute: routeLogin,
        navigatorKey: locator<Router>().navigatorKey,
        onGenerateRoute: Router.generateRoute,
      )
    );
  }
}
