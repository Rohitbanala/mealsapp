import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  
  });
  final String? title;
  final List<Meal> meals;
  
  @override
  Widget build(BuildContext context) {
    
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        mealData: meals[index],
        onSelectMeal: (meal) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealDetails(meal: meal,),
            ),
          );
        },
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "uh oh.....nothing here!",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Try selecting different category...",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return Scaffold(
        body: content,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
