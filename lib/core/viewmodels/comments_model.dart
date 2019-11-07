import 'package:prac_arch_provider_filledstack/core/enums/viewstate.dart';
import 'package:prac_arch_provider_filledstack/core/models/comment.dart';
import 'package:prac_arch_provider_filledstack/core/services/api.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/base_model.dart';
import 'package:prac_arch_provider_filledstack/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}