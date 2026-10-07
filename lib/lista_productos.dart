import 'package:flutter/material.dart';

const _purple = Color(0xFF28176F);
const _pageBackground = Color(0xFFF6F5FA);

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

const _products = [
  Product(
    name: 'Mantenimiento de celulares',
    category: 'Celulares',
    price: 0,
    emoji: '📱',
    color: Color(0xFFFFE5DC),
    rating: 0,
  ),
  Product(
    name: 'Diagnóstico de celular',
    category: 'Celulares',
    price: 0,
    emoji: '🔧',
    color: Color(0xFFFCE4EC),
    rating: 0,
  ),
  Product(
    name: 'Mantenimiento de computadoras',
    category: 'Computadoras',
    price: 0,
    emoji: '💻',
    color: Color(0xFFFFF3D5),
    rating: 0,
  ),
  Product(
    name: 'Diagnóstico de computadora',
    category: 'Computadoras',
    price: 0,
    emoji: '🛠️',
    color: Color(0xFFE3F4E5),
    rating: 0,
  ),
  Product(
    name: 'Curso online de computación',
    category: 'Cursos online',
    price: 0,
    emoji: '🎓',
    color: Color(0xFFEDE7F6),
    rating: 0,
  ),
  Product(
    name: 'Curso online de mantenimiento',
    category: 'Cursos online',
    price: 0,
    emoji: '🧑‍💻',
    color: Color(0xFFE3F4E5),
    rating: 0,
  ),
];

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'Todos';
  String _searchQuery = '';
  int _cartCount = 0;

  static const _categories = [
    'Todos',
    'Celulares',
    'Computadoras',
    'Cursos online',
  ];

  List<Product> get _visibleProducts {
    return _products.where((product) {
      final matchesCategory =
          _selectedCategory == 'Todos' ||
          product.category == _selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _addToCart(Product product) {
    setState(() => _cartCount++);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} agregado a tu lista de consultas'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      appBar: AppBar(
        backgroundColor: _purple,
        foregroundColor: Colors.white,
        titleSpacing: 20,
        title: const Text(
          'Listado de productos',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Badge(
                isLabelVisible: _cartCount > 0,
                label: Text('$_cartCount'),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildIntro()),
            SliverToBoxAdapter(child: _buildSearch()),
            SliverToBoxAdapter(child: _buildCategories()),
            SliverToBoxAdapter(child: _buildSectionHeading()),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF39258C), _purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EMEXSIS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Mantenimiento de celulares y computadoras, más cursos online para aprender desde donde estés.',
            style: TextStyle(color: Color(0xFFE3DFFC), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _searchQuery = value.trim()),
        decoration: InputDecoration(
          hintText: 'Buscar servicios o cursos...',
          prefixIcon: const Icon(Icons.search, color: _purple),
          suffixIcon: _searchQuery.isEmpty
              ? null
              : IconButton(
                  tooltip: 'Limpiar búsqueda',
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                  icon: const Icon(Icons.close),
                ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            showCheckmark: false,
            selectedColor: _purple,
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF514D5C),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            onSelected: (_) => setState(() => _selectedCategory = category),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeading() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 12),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Servicios y cursos',
              style: TextStyle(
                color: Color(0xFF252136),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '${_visibleProducts.length} opciones',
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    final products = _visibleProducts;
    if (products.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'No encontramos servicios o cursos con esa búsqueda.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.crossAxisExtent >= 650 ? 2 : 1;
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _ProductCard(
                product: products[index],
                onAdd: () => _addToCart(products[index]),
              ),
              childCount: products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisExtent: 124,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product, required this.onAdd});

  final Product product;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 1,
      shadowColor: _purple.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 88,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(product.emoji, style: const TextStyle(fontSize: 38)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF27243A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.category,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF696675),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    product.priceLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton.filled(
                  tooltip: 'Consultar ${product.name}',
                  onPressed: onAdd,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF0EDFA),
                    foregroundColor: _purple,
                    minimumSize: const Size(36, 36),
                    maximumSize: const Size(36, 36),
                    padding: EdgeInsets.zero,
                  ),
                  icon: const Icon(Icons.add_shopping_cart, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}