import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prac_arch_provider_filledstack/core/models/post.dart';
import 'package:prac_arch_provider_filledstack/ui/views/home_view.dart';
import 'package:prac_arch_provider_filledstack/ui/views/login_view.dart';
import 'package:prac_arch_provider_filledstack/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
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