import 'package:flutter/material.dart';
import 'package:prac_arch_provider_filledstack/core/models/post.dart';
import 'package:prac_arch_provider_filledstack/core/models/user.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/app_colors.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/text_styles.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/ui_helpers.dart';
import 'package:prac_arch_provider_filledstack/ui/widgets/comments.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}
