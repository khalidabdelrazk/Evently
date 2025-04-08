import 'package:evently/core/routes/route_names.dart';
import 'package:evently/screens/home%20screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes{
  static Map<String, Widget Function(BuildContext)> myAppRoutes = {
    RouteNames.homeScreen : (_) => HomeScreen(),
  };
}