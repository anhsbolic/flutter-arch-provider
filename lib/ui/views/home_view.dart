import 'package:flutter/material.dart';
import 'package:prac_arch_provider_filledstack/core/enums/viewstate.dart';
import 'package:prac_arch_provider_filledstack/core/models/post.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/home_model.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/app_colors.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/text_styles.dart';
import 'package:prac_arch_provider_filledstack/ui/shared/ui_helpers.dart';
import 'package:prac_arch_provider_filledstack/ui/views/base_view.dart';
import 'package:prac_arch_provider_filledstack/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';
import 'package:prac_arch_provider_filledstack/core/models/user.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) {
          model.getPosts(Provider.of<User>(context).id);
        },
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: model.state == ViewState.Idle
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        UIHelper.verticalSpaceLarge(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Welcome ${Provider.of<User>(context).name}',
                            style: headerStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Here are all your posts',
                              style: subHeaderStyle),
                        ),
                        UIHelper.verticalSpaceSmall(),
                        Expanded(child: _getPostsUi(model.posts)),
                      ])
                : Center(child: CircularProgressIndicator())));
  }

  Widget _getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        ),
      );
}
