// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn3/Navbar/Botton_Navbar.dart';
import 'package:learn3/Services/provider/auth.dart';
import 'package:learn3/authentication/auth_home.dart';
import 'package:learn3/authentication/login.dart';
import 'package:learn3/utils/const_values.dart';
import 'package:learn3/view/NavPages/explore.dart';
import 'package:learn3/view/course/quiz_landing_page.dart';
import 'package:learn3/view/home/view_courses.dart';
import 'package:learn3/view/onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()..loadThemePreference()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Auth Demo',
              theme: themeProvider.lightTheme,
              darkTheme: themeProvider.darkTheme,
              themeMode: themeProvider.themeMode,
              initialRoute: '/',
              routes: {
                '/': (context) => AuthHome(),
                '/coursesHome': (context) => HomePage()
              });
        },
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  static const String _themePrefKey = 'themePref';

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themePrefKey, isDarkMode);
  }

  Future<void> loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool(_themePrefKey) ?? false;
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffFBF7FF),
    primaryColor: const Color(0xFFE6007E),
    useMaterial3: true,
    primarySwatch: createMaterialColor(Color.fromRGBO(230, 0, 126, 1)),
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFE6007E).withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: AppConstants.primaryColor.withOpacity(0.2),
        ),
      ),
    ),
    cardColor: Colors.white,
    dividerColor: Colors.grey,
  );

  final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFFE6007E),
    useMaterial3: true,
    primarySwatch: createMaterialColor(Color.fromRGBO(230, 0, 126, 1)),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff0E1116),
    iconTheme: IconThemeData(color: Color(0xFFFFC0CB)),
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFFFC0CB).withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color(0xFFFFC0CB),
        ),
      ),
    ),
    cardColor: Color(0xFF1E1E1E),
    dividerColor: Colors.white54,
  );

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
