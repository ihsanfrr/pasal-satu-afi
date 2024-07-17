part of '../../screens.dart';

class HomeWrapperController extends GetxController {
  List<Widget> pages = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }
}
