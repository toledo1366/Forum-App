import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forum_app/utils/extentions/scroll_controller_extention.dart';

import '../../../domain/models/posts/post.dart';
import '../../cubits/remote_posts/remote_posts_cubit.dart';
import '../../cubits/remote_posts/remote_posts_state.dart';
import '../../widgets/posts_widget.dart';

class PostsView extends HookWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remotePostsCubit = BlocProvider.of<RemotePostsCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remotePostsCubit.getPosts();
      });

      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemotePostsCubit, RemotePostsState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RemotePostsLoading:
              return const Center(child: CupertinoActivityIndicator());
            case RemotePostsSuccess:
              return _buildPosts(
                scrollController,
                state.posts
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildPosts(
    ScrollController scrollController,
    List<Post> posts,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => PostsWidget(
              post: posts[index],
            ),
            childCount: posts.length,
          ),
        )
      ],
    );
  }
}