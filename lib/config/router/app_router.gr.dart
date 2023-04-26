// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PostsViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PostsView(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          PostsViewRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [PostsView]
class PostsViewRoute extends PageRouteInfo<void> {
  const PostsViewRoute()
      : super(
          PostsViewRoute.name,
          path: '/',
        );

  static const String name = 'PostsViewRoute';
}
