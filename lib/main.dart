// import 'package:eduhub_mobile/env/env.dart';
import 'package:eduhub_mobile/firebase_options.dart';
import 'package:eduhub_mobile/screens/account_screen.dart';
import 'package:eduhub_mobile/screens/home_screen.dart';
import 'package:eduhub_mobile/screens/login_screen.dart';
import 'package:eduhub_mobile/screens/signup_screen.dart';
import 'package:eduhub_mobile/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  // await Supabase.initialize(
  //     authFlowType: AuthFlowType.pkce,
  //     url: Env.DATABASE_URL,
  //     anonKey:
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhzdWJnZnhnemdoZG50dWllcWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk1NjU3MTIsImV4cCI6MjAxNTE0MTcxMn0.8pzBzT3L-ywckwXj1atUEDI2ApDAAGlBXaZpr8RoKMQ');
  runApp(const MyApp());
}

// final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduHub',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignUpScreen(),
        '/home': (_) => const HomeScreen(),
        '/account':(_) => const AccountScreen(),
      }
      // home: const LoginScreen(),
    );
  }
}
