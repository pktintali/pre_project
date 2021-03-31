import 'index.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabData()),
        Provider<AuthManager>(
            create: (_) => AuthManager(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<AuthManager>().authStateChange,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        initialRoute: RouteManager.initialRoute,
        routes: RouteManager.routes(context),
        onUnknownRoute: (settings) =>
            RouteManager.onUnknownRoute(context, settings: settings),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(primaryColor: Colors.green),
        title: 'Pre Project',
        // home: LandingPage(),
      ),
    );
  }
}
