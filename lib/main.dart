import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/CartProvider.dart';
import 'package:shoppingapp/LikedProvider.dart';
import 'package:shoppingapp/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => LikedProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Gaming Shop",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              size: 24,
              color: Color.fromARGB(255, 116, 118, 116),
            ),
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          fontFamily: "gstyle",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Colors.black,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
