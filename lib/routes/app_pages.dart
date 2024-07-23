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
      name: _Paths.regulationSearch,
      page: () => const RegulationSearchScreen(),
      binding: RegulationSearchBinding(),
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
      name: _Paths.forumEdit,
      page: () => const ForumEditScreen(),
      binding: ForumEditBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.forumDiscussion,
      page: () => const ForumDiscussionScreen(),
      binding: ForumDiscussionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.chatAI,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.chatAIHistory,
      page: () => const ChatHistoryScreen(),
      binding: ChatHistoryBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.chatConversation,
      page: () => const ChatConversationScreen(),
      binding: ChatConversationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.accountInfo,
      page: () => const AccountInfoScreen(),
      binding: ProfilePageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.setting,
      page: () => const SettingScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.privacyPolicy,
      page: () => const PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.aboutDeveloper,
      page: () => const AboutDeveloperScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
