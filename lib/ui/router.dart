import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prac_arch_provider_filledstack/core/models/post.dart';
import 'package:prac_arch_provider_filledstack/ui/route_names.dart';
import 'package:prac_arch_provider_filledstack/ui/views/home_view.dart';
import 'package:prac_arch_provider_filledstack/ui/views/login_view.dart';
import 'package:prac_arch_provider_filledstack/ui/views/post_view.dart';

class Router {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateReplaceTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeView());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginView());
      case routePost:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No Route Defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}