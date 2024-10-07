import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/favorite_provider.dart';
import 'package:meals_app/Provider/filters_provider.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

var initialFilters = {};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  void selectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSelected(String Identifier) async {
    Navigator.of(context).pop();
    if (Identifier == "Filters") {
      Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    List<Widget> screens = [
      CategoriesScreen(
        filterMeal: availableMeals,
      ),
      MealsScreen(
        meals: favoriteMeals,
      ),
    ];
    return Scaffold(
      drawer: MainDrawer(
        onSelected: _onSelected,
      ),
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? "Categories" : "Your Favorites",
        ),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedIndex(index);
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
