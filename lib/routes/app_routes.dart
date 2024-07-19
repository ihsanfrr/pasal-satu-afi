part of 'routes.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const home = _Paths.home;
  static const regulation = _Paths.regulation;
  static const regulationList = _Paths.regulationList;
  static const regulationDetail = _Paths.regulationDetail;
  static const regulationSearch = _Paths.regulationSearch;
  static const article = _Paths.article;
  static const articleDetail = _Paths.articleDetail;
  static const forum = _Paths.forum;
  static const forumEdit = _Paths.forumEdit;
  static const forumDiscussion = _Paths.forumDiscussion;
  static const chatAI = _Paths.chatAI;
  static const accountInfo = _Paths.accountInfo;
  static const setting = _Paths.setting;
  static const privacyPolicy = _Paths.privacyPolicy;
  static const aboutDeveloper = _Paths.aboutDeveloper;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const regulation = '/regulation';
  static const regulationList = '/regulation-list';
  static const regulationDetail = '/regulation-detail';
  static const regulationSearch = '/regulation-search';
  static const article = '/article';
  static const articleDetail = '/article-detail';
  static const forum = '/forum';
  static const forumEdit = '/forum-edit';
  static const forumDiscussion = '/forum-discussion';
  static const chatAI = '/chat-AI';
  static const accountInfo = '/account-info';
  static const setting = '/setting';
  static const privacyPolicy = '/privacy-policy';
  static const aboutDeveloper = '/about-developer';
}
