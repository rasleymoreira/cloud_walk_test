import 'package:cloud_walk_test/common/message/generic_message.dart';
import 'package:cloud_walk_test/di/app_di.dart';
import 'package:cloud_walk_test/navigation/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'base_controller.dart';
abstract class BaseState<T extends StatefulWidget, C extends BaseController> extends State<T> {
  final C controller = AppDI.it.get();

  bool get disposeController => true;

  late final RxDisposer _goToInitialPageListener;

  @override
  void initState() {
    super.initState();
    controller.onInit();
    _goToInitialPageListener = rxObserver(() async {
      if (controller.goToInitialPage == true) {
        context.pushReplacement(AppRouter.location.path);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _goToInitialPageListener();
    if (disposeController) controller.dispose();
  }
}
