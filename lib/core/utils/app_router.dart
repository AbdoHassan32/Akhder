import 'package:akhder/features/auth/presentation/views/login_view.dart';
import 'package:akhder/features/auth/presentation/views/register_view.dart';
import 'package:akhder/features/disease_detection/presentation/views/disease_detection_view.dart';
import 'package:akhder/features/home/data/models/product.dart';
import 'package:akhder/features/home/presentation/views/agricultural_fertilizers_item_view.dart';
import 'package:akhder/features/home/presentation/views/corps_item_view.dart';
import 'package:akhder/features/home/presentation/views/home_view.dart';
import 'package:akhder/features/home/presentation/views/insecticides_item_view.dart';
import 'package:akhder/features/home/presentation/views/seeds_item_view.dart';
import 'package:akhder/features/irregation/presentation/views/irrigation_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/item_details_view.dart';
import '../../features/home/presentation/views/tools_item_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{
  static String kSplashView = '/splashView';
  static String kOnboardingView = '/onboardingView';
  static String kLoginView = '/loginView';
  static String kRegisterView = '/registerView';
  static String kHomeView = '/homeView';
  static String kItemDetailsView = '/itemDetailsView';
  static String kDiseaseDetectionView = '/diseaseDetectionView';
  static String kIrrigationView = '/irrigationView';
  static String kSeedsItemView='/seedsItemView';
  static String kToolsItemView='/toolsItemView';
  static String kCorpsItemView='/corpsItemView';
  static String kInsecticidesItemView='/insecticidesItemView';
  static String kFertilizersItemView='/fertilizersItemView';

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
          builder: (context , state) =>  ItemDetailsView(product: state.extra as Product),
      ),
      GoRoute(
        path: kDiseaseDetectionView,
        builder: (context , state) => const DiseaseDetectionView(),
      ),
      GoRoute(
        path: kIrrigationView,
        builder: (context , state) => const IrrigationView(),
      ),
      GoRoute(
        path: kFertilizersItemView,
        builder: (context , state) => const FertilizersView(),
      ),
      GoRoute(
        path: kCorpsItemView,
        builder: (context , state) => const CorpsItemView(),
      ),
      GoRoute(
        path: kInsecticidesItemView,
        builder: (context , state) => const InsecticidesItemView(),
      ),
      GoRoute(
        path: kToolsItemView,
        builder: (context , state) => const ToolsItemView(),
      ),
      GoRoute(
        path: kSeedsItemView,
        builder: (context , state) => const SeedsItemView(),
      ),

    ],
);
}