import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';

import '../common/common.dart';
import '../routes/routes.dart';
import '../widgets/widgets.dart';
import '../resources/resources.dart';

part './splash/splash_screen.dart';
part './splash/bindings/splash_binding.dart';
part './splash/controllers/splash_controller.dart';

part './auth/login_screen.dart';
part './auth/register_screen.dart';
part './auth/bindings/login_binding.dart';
part './auth/bindings/register_binding.dart';
part './auth/controllers/login_controller.dart';
part './auth/controllers/register_controller.dart';

part './home/home_screen.dart';
part './home/profile_screen.dart';
part './home/home_wrapper_screen.dart';
part './home/bindings/home_binding.dart';
part './home/bindings/profile_binding.dart';
part './home/controllers/home_controller.dart';
part './home/bindings/home_wrapper_binding.dart';
part './home/controllers/profile_controller.dart';
part './home/controllers/home_wrapper_controller.dart';

part './regulation/regulation_screen.dart';
part './regulation/regulation_list_screen.dart';
part './regulation/regulation_detail_screen.dart';
part './regulation/regulation_search_screen.dart';
part './regulation/bindings/regulation_binding.dart';
part './regulation/bindings/regulation_list_binding.dart';
part './regulation/controllers/regulation_controller.dart';
part './regulation/bindings/regulation_search_binding.dart';
part './regulation/bindings/regulation_detail_binding.dart';
part './regulation/controllers/regulation_list_controller.dart';
part './regulation/controllers/regulation_search_controller.dart';
part './regulation/controllers/regulation_detail_controller.dart';

part './article/article_screen.dart';
part './article/article_detail_screen.dart';
part './article/bindings/article_binding.dart';
part './article/controllers/article_controller.dart';
part './article/bindings/article_detail_binding.dart';
part './article/controllers/article_detail_controller.dart';

part './forum/forum_screen.dart';
part './forum/forum_edit_screen.dart';
part './forum/bindings/forum_binding.dart';
part './forum/forum_discussion_screen.dart';
part './forum/bindings/forum_edit_binding.dart';
part './forum/controllers/forum_controller.dart';
part './forum/bindings/forum_discussion_binding.dart';
part './forum/controllers/forum_edit_controller.dart';
part './forum/controllers/forum_discussion_controller.dart';

part './chat/chat_screen.dart';
part './chat/chat_history_screen.dart';
part './chat/bindings/chat_binding.dart';
part './chat/chat_conversation_screen.dart';
part './chat/controllers/chat_controller.dart';
part './chat/bindings/chat_history_binding.dart';
part './chat/bindings/chat_conversation_binding.dart';
part './chat/controllers/chat_history_controller.dart';
part './chat/controllers/chat_conversation_controller.dart';

part './profile/setting_screen.dart';
part './profile/account_info_screen.dart';
part './profile/privacy_policy_screen.dart';
part './profile/about_developer_screen.dart';
part './profile/bindings/profile_page_binding.dart';
part './profile/controllers/profile_page_controller.dart';
