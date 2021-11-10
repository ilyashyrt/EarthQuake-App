import 'package:earthquake_app/constants/constants.dart';
import 'package:earthquake_app/view/earthquake_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      home: EarthQuakeView(),
    );
  }
}
