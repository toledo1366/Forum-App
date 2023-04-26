import 'package:forum_app/domain/models/posts/post.dart';

import '../../../domain/repositories/posts_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';

part 'remote_posts_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemotePostsState, List<Post>> {
  final PostsRepository _apiRepository;

  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesLoading(), []);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getBreakingNewsArticles();

      if (response is DataSuccess) {
        final articles = response.data!.;

        data.addAll(articles);
        _page++;

        emit(RemotePostsSuccess(articles: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemotePostsFailed(error: response.error));
      }
    });
  }
}