class FoodRecipes {
  final String id;
  final String title;
  final String imagePath;
  final List<Map<String, String>> ingredients;
  final int cookTime;
  final int calories;
  final int servings;
  final List<String> steps;

  FoodRecipes({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.ingredients,
    required this.cookTime,
    required this.calories,
    required this.servings,
    required this.steps,
  });
}

var FoodRecipesList = [
  FoodRecipes(
    id: '1',
    title: 'Burger',
    imagePath: 'images/Burger.jfif',
    ingredients: [
      {'name': 'Bun', 'amount': '1 piece'},
      {'name': 'Beef Patty', 'amount': '1 piece'},
      {'name': 'Lettuce', 'amount': '1 leaf'},
      {'name': 'Tomato', 'amount': '2 slices'},
      {'name': 'Cheese', 'amount': '1 slice'},
      {'name': 'Pickles', 'amount': '2 slices'}
    ],
    steps: [
      'Toast the bun until golden brown.',
      'Cook the beef patty on a hot grill for 5-6 minutes on each side.',
      'Assemble the burger with lettuce, tomato, cheese, and pickles on the bun.'
    ],
    cookTime: 20,
    calories: 600,
    servings: 1,
  ),
  FoodRecipes(
      id: '2',
      title: 'Salad',
      imagePath: 'images/Salad.jpg',
      ingredients: [
        {'name': 'Lettuce', 'amount': '1 cup'},
        {'name': 'Cherry Tomatoes', 'amount': '1/2 cup'},
        {'name': 'Cucumber', 'amount': '1/2 sliced'},
        {'name': 'Feta Cheese', 'amount': '1/4 cup'},
        {'name': 'Olives', 'amount': '1/4 cup'}
      ],
      steps: [
        'Chop lettuce, tomatoes, and cucumber.',
        'Combine all ingredients in a large bowl.',
        'Toss with dressing before serving.'
      ],
      cookTime: 10,
      calories: 200,
      servings: 2),
  FoodRecipes(
      id: '3',
      title: 'Lime Chicken Wings',
      imagePath: 'images/Lime-Chicken-Wings.jpg',
      ingredients: [
        {'name': 'Chicken Wings', 'amount': '10 pieces'},
        {'name': 'Lime Juice', 'amount': '2 tablespoons'},
        {'name': 'Garlic', 'amount': '2 cloves minced'},
        {'name': 'Honey', 'amount': '1 tablespoon'},
        {'name': 'Salt', 'amount': '1 teaspoon'}
      ],
      steps: [
        'Marinate chicken wings with lime juice, garlic, honey, and salt for 30 minutes.',
        'Preheat oven to 200°C.',
        'Bake wings for 20-25 minutes until crispy and golden.'
      ],
      cookTime: 25,
      calories: 450,
      servings: 2),
  FoodRecipes(
      id: '4',
      title: 'Black Forest Cake',
      imagePath: 'images/Black-Forest.jpg',
      ingredients: [
        {'name': 'Chocolate Sponge Cake', 'amount': '1 layer'},
        {'name': 'Whipped Cream', 'amount': '1 cup'},
        {'name': 'Cherry Filling', 'amount': '1/2 cup'},
        {'name': 'Dark Chocolate Shavings', 'amount': '1/4 cup'},
      ],
      steps: [
        'Slice the sponge cake in half horizontally.',
        'Spread whipped cream and cherry filling on one layer.',
        'Top with the second layer and cover with whipped cream.',
        'Garnish with chocolate shavings and cherries on top.'
      ],
      cookTime: 40,
      calories: 700,
      servings: 8),
  FoodRecipes(
    id: '5',
    title: 'Pizza',
    imagePath: 'images/pizza.jpg',
    ingredients: [
      {'name': 'Pizza Dough', 'amount': '1 piece'},
      {'name': 'Tomato Sauce', 'amount': '1/4 cup'},
      {'name': 'Mozzarella Cheese', 'amount': '1/2 cup shredded'},
      {'name': 'Pepperoni', 'amount': '10 slices'},
      {'name': 'Basil Leaves', 'amount': '5 leaves'}
    ],
    steps: [
      'Preheat oven to 475°F (245°C).',
      'Spread tomato sauce on the dough.',
      'Sprinkle mozzarella cheese evenly over the sauce.',
      'Place pepperoni slices on top and add basil leaves.',
      'Bake for 10-12 minutes until cheese is melted and crust is golden.'
    ],
    cookTime: 15,
    calories: 800,
    servings: 2,
  ),
  FoodRecipes(
    id: '6',
    title: 'Spaghetti Carbonara',
    imagePath: 'images/spagetti-carbonara.jpg',
    ingredients: [
      {'name': 'Spaghetti', 'amount': '200 grams'},
      {'name': 'Pancetta', 'amount': '100 grams'},
      {'name': 'Egg Yolks', 'amount': '2 pieces'},
      {'name': 'Parmesan Cheese', 'amount': '1/4 cup grated'},
      {'name': 'Black Pepper', 'amount': 'to taste'},
      {'name': 'Salt', 'amount': 'to taste'}
    ],
    steps: [
      'Cook the spaghetti in boiling water until al dente.',
      'Fry pancetta until crispy, then remove from heat.',
      'In a bowl, mix egg yolks and grated Parmesan cheese.',
      'Combine spaghetti with pancetta and egg mixture, stirring quickly.',
      'Season with black pepper and serve immediately.'
    ],
    cookTime: 20,
    calories: 600,
    servings: 2,
  ),
  FoodRecipes(
    id: '7',
    title: 'Caesar Salad',
    imagePath: 'images/vegan-caesar-salad.jpg',
    ingredients: [
      {'name': 'Romaine Lettuce', 'amount': '1 head'},
      {'name': 'Croutons', 'amount': '1/2 cup'},
      {'name': 'Caesar Dressing', 'amount': '1/4 cup'},
      {'name': 'Parmesan Cheese', 'amount': '1/4 cup shredded'},
      {'name': 'Chicken Breast', 'amount': '100 grams, grilled'}
    ],
    steps: [
      'Chop romaine lettuce and place in a large bowl.',
      'Add croutons and grilled chicken breast slices.',
      'Drizzle Caesar dressing over the salad and toss to coat.',
      'Sprinkle Parmesan cheese on top before serving.'
    ],
    cookTime: 10,
    calories: 350,
    servings: 1,
  ),
  FoodRecipes(
    id: '8',
    title: 'Chocolate Chip Cookies',
    imagePath: 'images/choco-chips.jpg',
    ingredients: [
      {'name': 'Butter', 'amount': '1/2 cup'},
      {'name': 'Brown Sugar', 'amount': '1/2 cup'},
      {'name': 'White Sugar', 'amount': '1/4 cup'},
      {'name': 'Egg', 'amount': '1 piece'},
      {'name': 'Vanilla Extract', 'amount': '1 tsp'},
      {'name': 'Flour', 'amount': '1 cup'},
      {'name': 'Baking Soda', 'amount': '1/2 tsp'},
      {'name': 'Salt', 'amount': '1/4 tsp'},
      {'name': 'Chocolate Chips', 'amount': '1 cup'}
    ],
    steps: [
      'Preheat oven to 350°F (175°C).',
      'Cream butter and sugars together until light and fluffy.',
      'Add egg and vanilla extract, mixing well.',
      'Combine flour, baking soda, and salt, then add to the mixture.',
      'Fold in chocolate chips.',
      'Drop spoonfuls of dough onto a baking sheet and bake for 10-12 minutes.'
    ],
    cookTime: 12,
    calories: 200,
    servings: 12,
  ),
  FoodRecipes(
    id: '9',
    title: 'Grilled Chicken Sandwich',
    imagePath: 'images/sandwich-chicken-grill.jpg',
    ingredients: [
      {'name': 'Chicken Breast', 'amount': '1 piece'},
      {'name': 'Lettuce', 'amount': '1 leaf'},
      {'name': 'Tomato', 'amount': '2 slices'},
      {'name': 'Mayonnaise', 'amount': '1 tbsp'},
      {'name': 'Sandwich Bread', 'amount': '2 slices'}
    ],
    steps: [
      'Grill the chicken breast until fully cooked, about 5-6 minutes per side.',
      'Spread mayonnaise on one slice of bread.',
      'Layer lettuce, tomato, and grilled chicken on the bread.',
      'Top with the other slice of bread and serve.'
    ],
    cookTime: 15,
    calories: 450,
    servings: 1,
  ),
];
