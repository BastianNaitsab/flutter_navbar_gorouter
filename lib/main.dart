import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Debemos envolver con MaterialApp.router
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Navbar GoRouter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // En routerConfig le pasamos el router()
      routerConfig: router(),
    );
  }
}

// Pantalla Home
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Las pantallas no deben usar scaffold, solo lo que ira en el body
    // ya que ShellRoute ya construye un marco fijo para la app
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Home View"),
          const Icon(Icons.home),
          ElevatedButton(
            onPressed: () {
              // Para navegar entre pantallas se usa esto context.go()
              context.go("/profile");
            },
            child: const Text("Ir a Profile"),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Profile View"),
          const Icon(Icons.person),
          ElevatedButton(
            onPressed: () {
              context.go("/home");
            },
            child: const Text("Ir a Home"),
          ),
        ],
      ),
    );
  }
}

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Fav View"),
          Icon(Icons.favorite),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Settings View"),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
