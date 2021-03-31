import 'package:flutter/material.dart';
import 'package:pre_project/pages/app_pages/LandingPage.dart';
import 'package:pre_project/pages/app_pages/unknown_page_screen.dart';
import 'package:pre_project/pages/product_related/ProductDetails.dart';
import '../index.dart';

class RouteManager {
  static String initialRoute = LandingPage.routeName;
  static Route<dynamic> onUnknownRoute(BuildContext context,
      {@required RouteSettings settings}) {
    final route = settings.name;
    if (route.contains('products')) {
      final id = route.replaceAll('/products/', '');
      return MaterialPageRoute(
          builder: (_) => ProductDetails(id: id), settings: settings);
    }

    return MaterialPageRoute(
        builder: (_) => UnknownPageScreen(settings: settings),
        settings: settings);
  }

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      LandingPage.routeName: (_) => LandingPage(),
      LoginPage.routename: (context) => LoginPage(),
      SignUp.routename: (context) => SignUp(),
      MainHomePage.id: (context) => MainHomePage(),
      Home.id: (context) => Home(),
      LandingProfile.routename: (context) => LandingProfile(),
      // ProductDetails.id: (context) => ProductDetails(),
      AddProduct.routename: (context) => AddProduct(),
      CategoryPage.routeName: (context) => CategoryPage(),
      SearchPage.routeName: (context) => SearchPage(),
    };
  }
}
