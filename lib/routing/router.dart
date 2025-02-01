import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../main.dart';

GoRouter router() {
  return GoRouter(
    // Ruta inicial, por defecto
    initialLocation: "/home",
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Página no encontrada')),
      );
    },
    routes: [
      // Rutas externas del ShellRoute

      // GoRoute(
      //   path: "/fav",
      //   builder: (context, state) => const FavScreen(),
      //   pageBuilder: (context, state) => NoTransitionPage(child: FavScreen()),
      // ),

      // ShellRoute para la barra de navegación fija
      ShellRoute(
        // Esto es lo que se va a proteger para la navegacion
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Navbar GoRouter Example"),
            ),

            // Aqui se muestran las paginas a las que se navega
            // es decir, child, es lo unico que cambia aqui, child es el contenido dinamico
            body: child,

            bottomNavigationBar: BottomNavigationBar(
              // Estilos para item seleccionado y NO seleccionados
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,

              // Esto es la logica de la navegacion fija
              currentIndex: _getCurrentIndex(state),
              onTap: (index) => _onBottomNavTapped(index, context),

              // Iconos del navbar
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Fav",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            ),
          );
        },

        // Rutas internas del ShellRoute
        routes: [
          GoRoute(
            // Se pone el path que se va a usar y la Screen a la que se refiere
            path: "/home",
            builder: (context, state) => const HomeScreen(),

            // Para configurar las transiciones
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: "/profile",
            builder: (context, state) => const ProfileScreen(),
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
          GoRoute(
            path: "/fav",
            builder: (context, state) => const FavScreen(),
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: FavScreen()),
          ),
          GoRoute(
            path: "/settings",
            builder: (context, state) => const SettingsScreen(),
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsScreen()),
          ),
        ],
      ),
    ],
  );
}

// Obtener el índice del BottomNavigationBar basado en la ruta actual
int _getCurrentIndex(GoRouterState state) {
  // cada que se agregue o se modifique una navegacion o screen en navbar fijo se debe modificar aqui

  // debugPrint(state.matchedLocation);
  switch (state.matchedLocation) {
    // Usamos state.location aquí
    case '/home':
      return 0;
    case '/profile':
      return 1;
    case '/fav':
      return 2;
    case '/settings':
      return 3;
    default:
      return 0; // Default to home if not matched
  }
}

// Cambiar la ruta cuando un ítem del BottomNavigationBar es tocado
void _onBottomNavTapped(int index, BuildContext context) {
  // cada que se agregue o se modifique una navegacion o screen en navbar fijo se debe modificar aqui

  switch (index) {
    case 0:
      context.go('/home');
      break;
    case 1:
      context.go('/profile');
      break;
    case 2:
      context.go('/fav');
      break;
    case 3:
      context.go('/settings');
      break;
  }
}
