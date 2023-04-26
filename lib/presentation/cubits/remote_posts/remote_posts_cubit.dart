import 'package:forum_app/domain/models/posts/post.dart';
import 'package:forum_app/presentation/cubits/remote_posts/remote_posts_state.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/posts_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';

class RemotePostsCubit extends BaseCubit<RemotePostsState, List<Post>> {
  final PostsRepository _postsRepository;

  RemotePostsCubit(this._postsRepository)
      : super(const RemotePostsLoading(), []);

  Future<void> getPosts() async {
    if (isBusy) return;

    await run(() async {
      final response = await _postsRepository.getPosts();

      if (response is DataSuccess) {
        final posts = response.data!;

        data.addAll(posts);

        emit(RemotePostsSuccess(posts: data));
      } else if (response is DataFailed) {
        emit(RemotePostsFailed(error: response.error));
      }
    });
  }
}