import '../utils/constants/path_provider.dart';

class TRoutesMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticate = false;
    return isAuthenticate ? null : const RouteSettings(name: TRoutes.login);
  }
}
