import 'package:flutter/material.dart';

void main() {
  runApp(const EmexsisApp());
}

class EmexsisApp extends StatelessWidget {
  const EmexsisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emexsis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// Contenedor principal con BottomNavigationBar funcional
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // Lista de vistas asignadas a cada pestaña
  final List<Widget> _screens = const [
    HomeContent(),
    Center(child: Text('Pantalla de Soporte Técnico', style: TextStyle(fontSize: 18))),
    Center(child: Text('Pantalla de Cursos', style: TextStyle(fontSize: 18))),
    ProfileScreen(), // <-- Pantalla de Perfil de Usuario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E3A8A),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Soporte'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Cursos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

// --- CONTENIDO DE LA HOME ---
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1E3A8A),
        title: const Text(
          'EMEXSIS',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¡Hola, Bienvenido! ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const Text(
              '¿Qué servicio o curso buscas hoy?',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Banner Promocional
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mantenimiento Express 💻📱', 
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '20% de descuento en diagnóstico de Laptops y Celulares.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1E3A8A),
                    ),
                    onPressed: () {},
                    child: const Text('Solicitar Cita'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Nuestros Servicios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildCategoryCard(
                    Icons.build_circle_outlined,
                    'Soporte Técnico',
                    'PC, Mac y Celulares',
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCategoryCard(
                    Icons.code,
                    'Academia / Cursos',
                    'Web, Flutter, Python',
                    Colors.indigo,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title, String subtitle, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

// --- PANTALLA DE PERFIL ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
        title: const Text('Mi Perfil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Encabezado del Perfil
            Container(
              width: double.infinity,
              color: const Color(0xFF1E3A8A),
              padding: const EdgeInsets.only(bottom: 24.0),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Usuario Emexsis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'usuario@emexsis.com',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Secciones de Opciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Icons.laptop_chromebook,
                    title: 'Mis Equipos en Mantenimiento',
                    subtitle: 'Consulta el estado de tu PC o celular',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.menu_book_rounded,
                    title: 'Mis Cursos Inscritos',
                    subtitle: 'Acceso a clases y material',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.history,
                    title: 'Historial de Servicios',
                    subtitle: 'Pagos y reparaciones anteriores',
                    onTap: () {},
                  ),
                  const Divider(height: 32),
                  _buildProfileOption(
                    icon: Icons.settings_outlined,
                    title: 'Configuración de Cuenta',
                    subtitle: 'Editar perfil, cambiar contraseña',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.help_outline,
                    title: 'Centro de Ayuda / Contacto',
                    subtitle: 'Soporte vía WhatsApp o llamadas',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF1E3A8A).withOpacity(0.1),
          child: Icon(icon, color: const Color(0xFF1E3A8A)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}