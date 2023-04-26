import 'package:forum_app/data/datasources/remote/posts/posts_remote_service.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/posts/post.dart';
import '../../../domain/repositories/posts_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../base_api_repository.dart';

class PostsRepositoryImpl extends BaseApiRepository implements PostsRepository {
  final PostsRemoteService postsRemoteService;

  PostsRepositoryImpl(this.postsRemoteService);
  
  @override
  Future<DataState<List<Post>>> getPosts() {
        return getStateOf<List<Post>>(
      request: () => postsRemoteService.getPosts(),
    );
  }
}