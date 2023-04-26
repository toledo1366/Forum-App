import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forum_app/locator.dart';
import 'package:forum_app/presentation/cubits/remote_posts/remote_posts_cubit.dart';
import 'package:forum_app/utils/constants/strings.dart';

import 'config/router/app_router.dart';
import 'config/themes/app_theme.dart';
import 'domain/repositories/posts_repository.dart';

void main() {
  _initCore();
  runApp(const MyApp());
}

void _initCore() {
  initializeDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemotePostsCubit(
            locator<PostsRepository>(),
          )..getPosts(),
        )
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: appTitle,
          theme: AppTheme.light,
        ),
    );
  }
}