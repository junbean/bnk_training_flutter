import 'package:ex_bank/data/DummyData.dart';
import 'package:ex_bank/models/bank_product.dart';
import 'package:ex_bank/widgets/product_card.dart';
import 'package:flutter/material.dart';

class BankProductsPage extends StatelessWidget {
  const BankProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: DummyData.categories.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            '금융 상품',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorColor: const Color(0xFFCB2B11),
            indicatorWeight: 3,
            unselectedLabelColor: Colors.grey[700],
            labelColor: const Color(0xFFCB2B11),
            labelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            tabs: DummyData.categories.map((category) {
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // 배경은 TabBar indicator로 처리
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(category),
                ),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: DummyData.categories.map((category) {
            final products = DummyData.getProductsByCategory(category);
            if (products.isEmpty) {
              return Center(
                child: Text(
                  '해당 카테고리의 상품이 없습니다',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductCard(
                    product: product,
                    onTap: () {
                      /*
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(product: product),
                        ),
                      );
                      */
                    },
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}









/*
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '금융 상품',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 탭바 영역
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
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
                              ? const Color(0xFFCB2B11)
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          DummyData.categories[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected ? Colors.white : Colors.grey[700],
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
            child: Container(
              color: Colors.white,
              child: _filteredProducts.isEmpty
                  ? Center(
                      child: Text(
                        '해당 카테고리의 상품이 없습니다',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
          ),
        ],
      ),
    );
  }
}
*/










/*

import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Content 1')),
          Center(child: Text('Content 2')),
          Center(child: Text('Content 3')),
        ],
      ),
    );
  }
}

*/