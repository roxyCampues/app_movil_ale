import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_movil_ale/main.dart';

void main() {
  testWidgets('navigates between home and products and filters services', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tecnología a tu alcance'), findsOneWidget);

    await tester.tap(find.text('Productos'));
    await tester.pumpAndSettle();

    expect(find.text('Listado de productos'), findsOneWidget);
    expect(find.text('Mantenimiento de celulares'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Cursos online'));
    await tester.pumpAndSettle();

    expect(find.text('Mantenimiento de celulares'), findsNothing);
    expect(find.text('Curso online de computación'), findsOneWidget);
    expect(find.text('Curso online de mantenimiento'), findsOneWidget);

    await tester.tap(find.byTooltip('Consultar Curso online de computación'));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(
      find.text('Curso online de computación agregado a tu lista de consultas'),
      findsOneWidget,
    );

    await tester.tap(find.text('Inicio'));
    await tester.pumpAndSettle();

    expect(find.text('Tecnología a tu alcance'), findsOneWidget);

    await tester.tap(find.text('Ver servicios y cursos'));
    await tester.pumpAndSettle();

    expect(find.text('Listado de productos'), findsOneWidget);
    expect(find.text('Curso online de computación'), findsOneWidget);
  });
}
