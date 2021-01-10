import 'index.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => User()),
          ChangeNotifierProvider(create: (_) => MyTheme()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routename,
      routes: {
        LoginPage.routename: (context) => LoginPage(),
        SignUp.routename: (context) => SignUp(),
        MainHomePage.id: (context) => MainHomePage(),
        Home.id: (context) => Home(),
        UserProfile.routename: (context) => UserProfile(),
        ProductDetails.id: (context) => ProductDetails(),
        VendorProfile.routename: (context) => VendorProfile(),
        AddProduct.routename: (context) => AddProduct(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(primaryColor: Colors.green),
      title: 'Pre Project',
      home: MainHomePage(),
    );
  }
}
