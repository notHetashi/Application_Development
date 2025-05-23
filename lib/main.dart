import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Cart(),
      child: MaterialApp(
        title: 'BuildHive Marketplace',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF1E2530),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF0D8AFF),
            secondary: Color(0xFF8BC34A),
            background: Color(0xFF1E2530),
            surface: Color(0xFF232A35),
            error: Color(0xFFE57373),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF171E27),
            foregroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          cardTheme: CardTheme(
            color: const Color(0xFF232A35),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF171E27),
            selectedItemColor: Color(0xFF0D8AFF),
            unselectedItemColor: Color(0xFFB0B8C1),
            selectedLabelStyle: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontWeight: FontWeight.w400,
            ),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            displayMedium: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            displaySmall: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headlineLarge: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headlineSmall: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            titleLarge: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            titleMedium: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            titleSmall: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFFB0B8C1),
            ),
            bodySmall: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFB0B8C1),
            ),
            labelLarge: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            labelMedium: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            labelSmall: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontFamily: 'Neue Haas Grotesk Display Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontFamily: 'Neue Haas Grotesk Display Pro',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              color: Color(0xFFb0B8C1),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Neue Haas Grotesk Display Pro',
              color: Color(0xFFB0B8C1),
            ),
          ),
          dividerColor: const Color(0xFF2A3340),
        ),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
