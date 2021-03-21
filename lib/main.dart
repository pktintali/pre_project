import 'index.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserData()),
        ChangeNotifierProvider(create: (_) => MyTheme()),
        ChangeNotifierProvider(create: (_) => CurrentProduct()),
        ChangeNotifierProvider(create: (_) => AuthField()),
        
      ],
      child: MyApp(),
    ),
  );
}