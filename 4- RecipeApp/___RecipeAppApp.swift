//___FILEHEADER___

import SwiftUI

@main
struct ___RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(recipes: [
                RecipeViewModel(recipe: Recipe(id: 782585, title: "Cannellini Bean and Asparagus Salad with Mushrooms", image: "https://spoonacular.com/recipeImages/782585-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 716426, title: "Cauliflower, Brown Rice, and Vegetable Fried Rice", image: "https://spoonacular.com/recipeImages/716426-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 715497, title: "Berry Banana Breakfast Smoothie", image: "https://spoonacular.com/recipeImages/715497-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 715415, title: "Red Lentil Soup with Chicken and Turnips", image: "https://spoonacular.com/recipeImages/715415-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 716406, title: "Asparagus and Pea Soup: Real Convenience Food", image: "https://spoonacular.com/recipeImages/716406-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 644387, title: "Garlicky Kale", image: "https://spoonacular.com/recipeImages/644387-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 715446, title: "Slow Cooker Beef Stew", image: "https://spoonacular.com/recipeImages/715446-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 782601, title: "Red Kidney Bean Jambalaya", image: "https://spoonacular.com/recipeImages/782601-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 795751, title: "Chicken Fajita Stuffed Bell Pepper", image: "https://spoonacular.com/recipeImages/795751-312x231.jpg")),
                RecipeViewModel(recipe: Recipe(id: 766453, title: "Hummus and Za'atar", image: "https://spoonacular.com/recipeImages/766453-312x231.jpg"))
            ])
        }
    }
}
