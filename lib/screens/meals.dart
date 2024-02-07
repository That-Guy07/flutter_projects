import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _switchToMealDetailsScreen(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        switchToMealDetailsScreen: () {
          _switchToMealDetailsScreen(context, meals[index]);
        },
      ),
      itemCount: meals.length,
    );
    if (meals.isEmpty) {
      content = Center(
        child: Text(
          'No meals found for this category.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 8,
        shadowColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
      ),
      body: content,
    );
  }
}
