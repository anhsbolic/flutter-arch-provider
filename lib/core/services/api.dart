import 'dart:convert';

import 'package:prac_arch_provider_filledstack/core/models/comment.dart';
import 'package:prac_arch_provider_filledstack/core/models/post.dart';
import 'package:prac_arch_provider_filledstack/core/models/user.dart';
import 'package:http/http.dart' as http;

class Api {

  static const endpoint = 'https://jsonplaceholder.typicode.com';
  var client = new http.Client();

  // Get User Profile
  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  // Get Posts
  Future<List<Post>> getPostsForUser(int userId) async {
    var response = await client.get('$endpoint/posts?userId=$userId');

    var posts = List<Post>();
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  // Get Posts
  Future<List<Comment>> getCommentsForPost(int postId) async {
    var response = await client.get('$endpoint/comments?postId=$postId');

    var comments = List<Comment>();
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }

}