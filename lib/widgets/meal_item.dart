import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.mealData,
    required this.onSelectMeal,
  });
  final Meal mealData;
  final Function(Meal meal) onSelectMeal;
  String get ComplexityText {
    return mealData.complexity.name[0] + mealData.complexity.name.substring(1);
  }

  String get AffordabilityText {
    return mealData.affordability.name[0] +
        mealData.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        splashColor: Colors.white,
        onTap: () {
          onSelectMeal(mealData);
        },
        child: Stack(
          children: [
            Hero(
              tag: mealData.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  mealData.imageUrl,
                ),
                fit: BoxFit.cover,
                height: 200.h,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 40.w),
                child: Column(
                  children: [
                    Text(
                      mealData.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealTrait(
                          icon: Icons.schedule,
                          label: "${mealData.duration} min",
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealTrait(
                          icon: Icons.work,
                          label: "$ComplexityText",
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealTrait(
                          icon: Icons.attach_money,
                          label: "$AffordabilityText",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
