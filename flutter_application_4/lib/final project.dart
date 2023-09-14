import 'package:flutter/material.dart';

void main() {
  runApp(FoodRecipeApp());
}

class FoodRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  final List<String> recipes = [
    'chicken alfredo',
    'steak',
    'tacos',
    // Add more recipes here
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
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipeName: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final String recipeName;

  RecipeDetailScreen({required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName),
      ),
      body: Center(
        child: Text(' $recipeName'),
      ),
    );
  }
}
