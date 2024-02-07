import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart'; // import transparent_image package
import 'package:meals/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal, required this.switchToMealDetailsScreen});

  final Meal meal;
  final void Function() switchToMealDetailsScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: switchToMealDetailsScreen,
        splashColor: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 230,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        MealitemTrait(
                          icon: Icons.schedule_rounded,
                          label: '${meal.duration} min',
                        ),
                        const Spacer(),
                        MealitemTrait(
                          icon: Icons.work_rounded,
                          label: meal.complexity.name[0].toUpperCase() +
                              meal.complexity.name.substring(1),
                        ),
                        const Spacer(),
                        MealitemTrait(
                          icon: Icons.attach_money_rounded,
                          label: meal.affordability.name[0].toUpperCase() +
                              meal.affordability.name.substring(1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
