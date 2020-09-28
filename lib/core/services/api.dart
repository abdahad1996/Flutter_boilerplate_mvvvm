import 'dart:convert';

// import 'package:Practice_Stacked/model/comment.dart';
// import 'package:Practice_Stacked/model/post.dart';
// import 'package:Practice_Stacked/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
 
 ///Group together features using Services and Single Responsibility
 
// The principle states "Keep the code together that will change for the same reasons,
//  separate the code that won't"
/// The service responsible for networking requests
@lazySingleton
class Api {
  // static const endpoint = 'https://jsonplaceholder.typicode.com';

  // http.Client client = http.Client();

  // Future<User> getUserProfile(int userId) async {
  //   final response = await client.get('$endpoint/users/$userId');
  //   return User.fromJson(json.decode(response.body));
  // }

  // Future<List<Post>> getPostsForUser(int userId) async {
  //   var posts = List<Post>();
  //   var response = await client.get('$endpoint/posts?userId=$userId');
  //   var parsed = json.decode(response.body) as List<dynamic>;
  //   for (var post in parsed) {
  //     posts.add(Post.fromJson(post));
  //   }

  //   return posts;
  // }

  // Future<List<Comment>> getCommentsForPost(int postId) async {
  //   final comments = List<Comment>();
  //   final response = await client.get('$endpoint/comments?postId=$postId');
  //   final parsed = json.decode(response.body) as List<dynamic>;
  //   for (final comment in parsed) {
  //     comments.add(Comment.fromJson(comment));
  //   }
  //   return comments;
  // }
}