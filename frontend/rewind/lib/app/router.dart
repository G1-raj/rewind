import 'package:go_router/go_router.dart';
import 'package:rewind/features/auth/presentation/auth_navigator/auth_navigator.dart';
import 'package:rewind/features/auth/presentation/signin_screen/signin_screen.dart';
import 'package:rewind/features/auth/presentation/signup_screen/signup_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth_navigator',

  routes: [
    GoRoute(
      path: '/auth_navigator',
      builder: (context, state) => AuthNavigator()
    ),

    GoRoute(
      path: '/signin',
      builder: (context, state) => SigninScreen(),
    ),

    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    )
  ]
);