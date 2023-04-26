import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/views/posts/posts_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: PostsView, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();

