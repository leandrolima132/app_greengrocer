import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseController extends Disposable {
  final pageController = PageController();
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
  }
}
