import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/pages/products_details_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Shop App",
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primaryTextTheme: GoogleFonts.montserratTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 227, 103),
            primary: const Color.fromARGB(255, 255, 227, 103),
          ),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            labelLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            labelMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            labelSmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
        home: const HomePage()
        // ProductDetails(
        //   // id: int.parse(products[0]['id'].toString()),
        //   title: products[0]['title'].toString(),
        //   price: double.parse(products[0]['price'].toString()),
        //   imageUrl: products[0]['imageUrl'].toString(),
        //   sizes: products[0]['sizes'] as List<int>,
        // ),
        );
  }
}
