import 'package:go_router/go_router.dart';
import '../features/Auth/Presentation/views/LoginView.dart';

class AppRoutes {
  static const String loginView = '/';

  static final GoRouter router = GoRouter(routes: [
        GoRoute(path: loginView , builder: (context, state) =>const LoginView() ,),

  ]);
}
