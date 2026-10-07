import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.name,
    required this.category,
    required this.price,
    required this.emoji,
    required this.color,
    required this.rating,
  });

  final String name;
  final String category;
  final double price;
  final String emoji;
  final Color color;
  final int rating;

  String get description => switch (name) {
    'Mantenimiento de celulares' =>
      'Limpieza y revisión para cuidar tu equipo.',
    'Diagnóstico de celular' =>
      'Identificamos posibles fallas y soluciones.',
    'Mantenimiento de computadoras' =>
      'Limpieza y optimización para tu computadora.',
    'Diagnóstico de computadora' =>
      'Revisamos el equipo y te explicamos qué necesita.',
    'Curso online de computación' =>
      'Aprende habilidades digitales desde casa.',
    'Curso online de mantenimiento' =>
      'Aprende cuidados básicos para tus equipos.',
    _ => '',
  };

  String get priceLabel => 'Consultar';
}
