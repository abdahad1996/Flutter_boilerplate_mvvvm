// import 'package:Practice_Stacked/App/locator.dart';
// import 'package:Practice_Stacked/model/post.dart';
import 'package:injectable/injectable.dart';

import 'api.dart';

//Share State / Functionality between ViewModels using Services
//to share data between viewmodels we create a common service.
// To share the data with another viewmodel you Create a service class for it. You can create a posts service which can then be accessed by your 
// ViewModels the same as any other service 
@lazySingleton
class PostsService {
  // final _api = locator<Api>();

  // List<Post> _posts;
  // List<Post> get posts => _posts;

  // bool get hasPosts => _posts != null && _posts.isNotEmpty;

  // Future<List<Post>> getPostsForUser(int userId) async {
  //   _posts = await _api.getPostsForUser(userId);
  //   return _posts;
  // }
}