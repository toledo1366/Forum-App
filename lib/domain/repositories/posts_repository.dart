import 'package:forum_app/domain/models/posts/post.dart';
import 'package:injectable/injectable.dart';

import '../../utils/resources/data_state.dart';

abstract class PostsRepository {
  Future<DataState<List<Post>>> getPosts();
}