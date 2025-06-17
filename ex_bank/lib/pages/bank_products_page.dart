import 'package:ex_bank/data/DummyData.dart';
import 'package:ex_bank/models/bank_product.dart';
import 'package:ex_bank/widgets/product_car.dart';
import 'package:flutter/material.dart';

class BankProductsPage extends StatefulWidget {
  const BankProductsPage({super.key});

  @override
  State<BankProductsPage> createState() => _BankProductsPageState();
}

class _BankProductsPageState extends State<BankProductsPage> {
  int _selectedIndex = 0;
  List<BankProduct> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = DummyData.getProductsByCategory('전체');
  }

  void _onCategoryChanged(int index) {
    setState(() {
      _selectedIndex = index;
      String category = DummyData.categories[index];
      _filteredProducts = DummyData.getProductsByCategory(category);
    });
  }

  void _navigateToDetail(BankProduct product) {
    /*
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '금융 상품',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 탭바 영역
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                overscroll: false,
                scrollbars: false,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: DummyData.categories.length,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  final isSelected = _selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => _onCategoryChanged(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          DummyData.categories[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // 상품 목록 영역
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      '해당 카테고리의 상품이 없습니다',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ProductCard(
                          product: product,
                          onTap: () => _navigateToDetail(product),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
