import 'package:auto_route/auto_route.dart';
import 'package:library_book/router/router.gr.dart';

@AutoRouterConfig()
class LibraryRouter extends $LibraryRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: HomePageRoute.page,
      fullscreenDialog: true,
      fullMatch: true,
    ),
    AutoRoute(
      page: BookDescriptionPageRoute.page,
      fullscreenDialog: true,
      fullMatch: true,
    ),
    AutoRoute(
        page: DetailBorrowedBookPageRoute.page,
        fullscreenDialog: true,
        fullMatch: true),
    AutoRoute(
        page: ListBorrowedBookPageRoute.page,
        fullscreenDialog: true,
        fullMatch: true),
    AutoRoute(
      page: LoginPageRoute.page,
      fullscreenDialog: true,
      fullMatch: true,
    ),
    AutoRoute(
      page: SignUpPageRoute.page,
      fullscreenDialog: true,
      fullMatch: true,
    ),
  ];
}
