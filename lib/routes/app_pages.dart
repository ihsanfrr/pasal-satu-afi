part of './routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeWrapperScreen(),
      binding: HomeWrapperBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.regulation,
      page: () => const RegulationScreen(),
      binding: RegulationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.regulationList,
      page: () => const RegulationListScreen(),
      binding: RegulationListBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.regulationDetail,
      page: () => const RegulationDetailScreen(),
      binding: RegulationDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.article,
      page: () => const ArticleScreen(),
      binding: ArticleBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.articleDetail,
      page: () => const ArticleDetailScreen(),
      binding: ArticleDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.forum,
      page: () => const ForumScreen(),
      binding: ForumBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.chatAI,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
