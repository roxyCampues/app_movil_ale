# EMEXSIS

Aplicación Flutter con navegación entre Inicio y el listado de productos,
servicios y cursos.

## Estructura del código

```text
lib/
  main.dart
  data/
    products.dart
  models/
    product.dart
  navigation/
    main_navigation.dart
  screens/
    home/
      home_page.dart
    products/
      product_list_page.dart
  theme/
    app_theme.dart
  widgets/
    product_card.dart
```

- `screens/home/`: contenido de Inicio.
- `screens/products/`: listado, búsqueda y filtros de productos.
- `navigation/`: barra inferior para cambiar entre Inicio y Productos.
- `models/` y `data/`: modelo y catálogo de productos.
- `widgets/`: componentes reutilizables, como la tarjeta de producto.
- `theme/`: colores y tema de la aplicación.

## Ejecutar y probar

```bash
flutter pub get
flutter run
flutter test
```
