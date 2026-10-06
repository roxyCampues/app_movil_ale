import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_movil_ale/main.dart';

void main() {
  testWidgets('filters services and adds one to the consultation list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Listado de productos'), findsOneWidget);
    expect(find.text('EMEXSIS'), findsOneWidget);
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
  });
}
