import 'package:flutter/material.dart';

extension NavigatorPopAll on NavigatorState {
  void popAllButOne() {
    popUntil((route) {
      return route.navigator?.canPop() == false;
    });
  }
}
