import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/meals_provider.dart';

enum Filter {
  gluttenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super(
          {
            Filter.gluttenFree: false,
            Filter.lactoseFree: false,
            Filter.vegetarian: false,
            Filter.vegan: false,
          },
        );
  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final mealsData = ref.watch(mealsProvider);
  final filteredMeals = ref.watch(filterProvider);
  return mealsData.where((meal) {
    if (filteredMeals[Filter.gluttenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filteredMeals[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filteredMeals[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filteredMeals[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
