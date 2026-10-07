import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onShowProducts});

  final VoidCallback onShowProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        foregroundColor: Colors.white,
        title: const Text(
          'EMEXSIS',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF39258C), purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.devices,
                      size: 44,
                      color: Colors.white,
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Tecnología a tu alcance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mantenimiento de celulares y computadoras, más cursos '
                      'online para aprender desde donde estés.',
                      style: TextStyle(
                        color: Color(0xFFE3DFFC),
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '¿Qué necesitas hoy?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Encuentra servicios de soporte para tus equipos y cursos '
                'para aprender nuevas habilidades.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black54,
                      height: 1.4,
                    ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: onShowProducts,
                style: FilledButton.styleFrom(
                  backgroundColor: purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ver Listado de productos'),
              ),
              const SizedBox(height: 24),
              _HomeFeature(
                icon: Icons.build_outlined,
                title: 'Mantenimiento y diagnóstico',
                description: 'Cuidado y revisión para celulares y computadoras.',
              ),
              const SizedBox(height: 12),
              _HomeFeature(
                icon: Icons.school_outlined,
                title: 'Cursos online',
                description: 'Aprende computación y mantenimiento a tu ritmo.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeFeature extends StatelessWidget {
  const _HomeFeature({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: purple.withValues(alpha: 0.1),
          foregroundColor: purple,
          child: Icon(icon),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(description),
      ),
    );
  }
}
