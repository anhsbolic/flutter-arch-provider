import 'package:prac_arch_provider_filledstack/core/enums/viewstate.dart';
import 'package:prac_arch_provider_filledstack/core/models/post.dart';
import 'package:prac_arch_provider_filledstack/core/services/api.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/base_model.dart';
import 'package:prac_arch_provider_filledstack/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}