import 'package:go_router/go_router.dart';
import 'package:rewind/features/auth/presentation/auth_navigator/auth_navigator.dart';
import 'package:rewind/features/auth/presentation/forgot_password/change_password.dart';
import 'package:rewind/features/auth/presentation/forgot_password/forgot_password_redirect.dart';
import 'package:rewind/features/auth/presentation/forgot_password/forgot_password_send_mail.dart';
import 'package:rewind/features/auth/presentation/signin_screen/signin_screen.dart';
import 'package:rewind/features/auth/presentation/signup_screen/signup_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth_navigator',

  routes: [
    GoRoute(
      path: '/auth_navigator',
      builder: (context, state) => const AuthNavigator()
    ),

    GoRoute(
      path: '/signin',
      builder: (context, state) => const SigninScreen(),
    ),

    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),

    GoRoute(
      path: '/forgot_password_send_mail',
      builder: (context, state) => const ForgotPasswordSendMail(),
    ),

    GoRoute(
      path: '/forgot_password_redirect',
      builder: (context, state) => const ForgotPasswordRedirect(),
    ),

    GoRoute(
      path: '/change_password',
      builder: (context, state) => const ChangePassword(),
    )
  ]
);