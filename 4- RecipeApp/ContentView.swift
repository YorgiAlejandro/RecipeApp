//
//  ContentView.swift
//  4- RecipeApp
//
//  Created by Yorgi Del Rio on 10/20/23.
//

import SwiftUI

//URL de Api
let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=1d540e21f87546ffa9493e266e938dbd")!

//Peticion Http
let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    if let data = data { //Desencapsulamiento para manejar nil
        let recipeList = try! JSONDecoder().decode(RecipeList.self, from: data)  //Aqui decodificamos la data
        let recipeViewModels = recipeList.results.map(RecipeViewModel.init) //Aqui mapeamos la data decodificada y la usamos para inicializar Recipe View Model
        let contentView = ContentView(recipes: recipeViewModels) //Aqui creamos una instancia de ContentView con los parametros
    }
}

struct Recipe: Codable { //Estructura de una Receta
    let id: Int
    let title: String
    let image: String
}

struct RecipeList: Codable { //Estructura de una lista de Recetas
    let results: [Recipe]
}

struct RecipeViewModel {  //Estructura de la vista de una receta
    let title: String
    let imageURL: URL
    let id: Int
    
    init(recipe: Recipe) {
        title = recipe.title
        imageURL = URL(string: recipe.image)!
        id = recipe.id
    }
}

struct ContentView: View {  //Estructura de Vista Principal
    let recipes: [RecipeViewModel] //Lista de Vistas de Receta
    
    var body: some View {
        NavigationView{
            List(recipes, id: \.title) { recipe in  //ForEach de la lista recipes
                NavigationLink {
                    VStack{
                        AsyncImage(url: recipe.imageURL).frame(width: 300, height: 300)
                        Text("Recipes Details of \(recipe.title) with Id: \(recipe.id)")
                        Spacer()
                    }
                } label: {
                    HStack {
                        AsyncImage(url: recipe.imageURL) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        Text(recipe.title).font(.title).bold()
                    }
                }
            }
            .navigationBarTitle("Recipes List:")
        }
        
    }
}


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
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
