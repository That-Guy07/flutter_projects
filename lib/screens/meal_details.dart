import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/favorite_icon.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        elevation: 8,
        shadowColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
        actions: [
          IconButton(
            icon: FavoriteIcon(
              isFavorite: meal.isFavorite,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                    fit: BoxFit.cover,
                    height: 230,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 20),
                        ...meal.ingredients.map(
                          (ingredient) => Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Text(
                                  ingredient,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                ),
                                const SizedBox(height: 7),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Steps',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 20),
                        ...meal.steps.map(
                          (step) => Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Text(
                                  step,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                ),
                                const SizedBox(height: 7),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
