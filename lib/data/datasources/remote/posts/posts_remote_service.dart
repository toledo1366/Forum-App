import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../domain/models/posts/post.dart';
import '../../../../utils/constants/strings.dart';

part 'posts_remote_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class PostsRemoteService {
  factory PostsRemoteService(Dio dio, {String baseUrl}) = _PostsRemoteService;

  @GET('/posts')
  Future<HttpResponse<List<Post>>> getPosts();
}