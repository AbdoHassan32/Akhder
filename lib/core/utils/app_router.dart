import 'package:akhder/features/auth/presentation/views/login_view.dart';
import 'package:akhder/features/auth/presentation/views/register_view.dart';
import 'package:akhder/features/home/presentation/views/home_view.dart';
import 'package:akhder/features/home/presentation/views/widgets/item_details_view_body.dart';
import 'package:go_router/go_router.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{
  static String kSplashView = '/splashView';
  static String kOnboardingView = '/onboardingView';
  static String kLoginView = '/loginView';
  static String kRegisterView = '/registerView';
  static String kHomeView = '/homeView';
  static String kItemDetailsView = '/itemDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context , state) => const SplashView(),
      ),
      GoRoute(
          path: kOnboardingView,
          builder: (context , state) => const OnboardingView(),
      ),
      GoRoute(
          path: kLoginView,
          builder: (context , state) => const LoginView(),
      ),
      GoRoute(
          path: kRegisterView,
          builder: (context , state) => const RegisterView(),
      ),
      GoRoute(
          path: kHomeView,
          builder: (context , state) => const HomeView(),
      ),
      GoRoute(
          path: kItemDetailsView,
          builder: (context , state) => const ItemDetailsViewBody(),
      ),
    ],
);
}