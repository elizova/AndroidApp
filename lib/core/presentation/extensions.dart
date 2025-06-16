import 'package:flutter/material.dart';

extension NavigatorPopAll on NavigatorState {
  void popAll() {
    popUntil((route) {
      return route.navigator?.canPop() == false;
    });
  }
}
