import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/app/core/constants/theme_constants.dart';
import 'package:greengrocer/app/core/widgets/category_tile.dart';
import 'package:greengrocer/app/core/data/app_data.dart' as app_data;
import 'package:greengrocer/app/core/widgets/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: ThemeConstants.customSwatchColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: ThemeConstants.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                showBadge: true,
                position: BadgePosition.topEnd(),
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                badgeStyle: BadgeStyle(
                  badgeColor: ThemeConstants.customContrastColor,
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: ThemeConstants.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Pesquise aqui',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
          // Categorias
          Container(
            height: 40,
            padding: const EdgeInsets.only(left: 25),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                  onPressed: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: app_data.categories.length,
            ),
          ),
          // Grid
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: app_data.items[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
