
class RecipesModal {
  late List<RecipesData> recipes = [];

  RecipesModal({required this.recipes});

  factory RecipesModal.fromJson(Map m1)
  {
    return RecipesModal(recipes: (m1['recipes'] as List).map((e) => RecipesData.fromJson(e),).toList());
  }
}

class RecipesData {
  late int id, prepTimeMinutes, cookTimeMinutes, reviewCount,servings,caloriesPerServing;
  late String name, image,cuisine,difficulty;
  late List tags = [];
  late List ingredients = [];
  late List instructions = [];

  RecipesData(
      {
        required this.caloriesPerServing,
        required this.difficulty,
        required this.servings,
        required this.id,
        required this.prepTimeMinutes,
        required this.cookTimeMinutes,
        required this.reviewCount,
        required this.name,
        required this.image,
        required this.tags,
        required this.ingredients,
        required this.instructions,
        required this.cuisine});

  factory RecipesData.fromJson(Map m1) {
    return RecipesData(
      caloriesPerServing: m1['caloriesPerServing'],
      servings: m1['servings'],
        difficulty : m1['difficulty'],
        id: m1['id'],
        prepTimeMinutes: m1['prepTimeMinutes'],
        cookTimeMinutes: m1['cookTimeMinutes'],
        reviewCount: m1['reviewCount'],
        name: m1['name'],
        image: m1['image'],
        tags: m1['tags'],
        ingredients: m1['ingredients'],
        instructions: m1['instructions'],
        cuisine: m1['cuisine']
    );
  }
}