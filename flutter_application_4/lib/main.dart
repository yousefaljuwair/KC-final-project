import 'package:flutter/material.dart';

void main() => runApp(RecipeApp());

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeList(),
    );
  }
}

class RecipeList extends StatelessWidget {
  // Sample list of food recipes
  final List<Recipe> recipes = [
    Recipe('Spaghetti Carbonara', 'Delicious Italian pasta dish https://cooking.nytimes.com/recipes/12965-spaghetti-carbonara'),
    Recipe('chicken Curry', 'A flavorful chicken curry recipe https://www.indianhealthyrecipes.com/chicken-curry/'),
    Recipe('Chocolate Cake', 'Indulge in this sweet dessert https://addapinch.com/the-best-chocolate-cake-recipe-ever/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            onTap: () {
              // Navigate to the recipe detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetail(recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Recipe {
  final String name;
  final String description;

  Recipe(this.name, this.description);
}

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  RecipeDetail(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              recipe.description,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}