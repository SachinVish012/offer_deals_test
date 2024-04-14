import 'package:flutter/material.dart';

class ScrollUtils {

  static void scrollListener(ScrollController scrollController, Function loadMoreCallback) {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      loadMoreCallback();
    }
  }

  static void loadMoreData(Function loadCallback) async {
    print("load");
    await Future.delayed(Duration(seconds: 2));
    print("load finished");
    loadCallback();
  }
}
