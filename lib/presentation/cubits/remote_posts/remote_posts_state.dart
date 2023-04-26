import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:forum_app/domain/models/posts/post.dart';

abstract class RemotePostsState extends Equatable {
  final List<Post> posts;
  final DioError? error;

  const RemotePostsState({
    this.posts = const [],
    this.error,
  });

  @override
  List<Object?> get props => [posts, error];
}

class RemotePostsLoading extends RemotePostsState {
  const RemotePostsLoading();
}

class RemotePostsSuccess extends RemotePostsState {
  const RemotePostsSuccess({super.posts});
}

class RemotePostsFailed extends RemotePostsState {
  const RemotePostsFailed({super.error});
}