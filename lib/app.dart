import 'index.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthManager>(
          create: (_) => AuthManager(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthManager>().authStateChange,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        // initialRoute: data.user!=null ? MainHomePage.id:LoginPage.routename,
        routes: {
          LoginPage.routename: (context) => LoginPage(),
          SignUp.routename: (context) => SignUp(),
          MainHomePage.id: (context) => MainHomePage(),
          Home.id: (context) => Home(),
          LandingProfile.routename: (context) => LandingProfile(),
          ProductDetails.id: (context) => ProductDetails(),
          VendorProfile.routename: (context) => VendorProfile(),
          AddProduct.routename: (context) => AddProduct(),
          CategoryPage.routeName: (context) => CategoryPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(primaryColor: Colors.green),
        title: 'Pre Project',
        home: LandingPage(),
      ),
    );
  }
}
