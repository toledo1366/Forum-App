import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/posts/posts_remote_service.dart';
import 'data/repositories/posts_repository/post_repository_impl.dart';
import 'domain/repositories/posts_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<PostsRemoteService>(
    PostsRemoteService(locator<Dio>()),
  );

  locator.registerSingleton<PostsRepository>(
    PostsRepositoryImpl(locator<PostsRemoteService>()),
  );
}