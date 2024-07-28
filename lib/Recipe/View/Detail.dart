import 'package:api_pixbay/Recipe/Modal/recipe_modal.dart';
import 'package:api_pixbay/Recipe/Provider/provider_recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    RecipesProvider recipesProvidertrue=Provider.of<RecipesProvider>(context,listen: true);
    RecipesProvider recipesProviderfalse=Provider.of<RecipesProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Recipe'),

      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: recipesProviderfalse.fromMap(),
          builder: (context,snapshot)
          {
            if (snapshot.hasData)
            {
              RecipesModal? recipe = snapshot.data;
               return Padding(
        
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${recipe!.recipes[recipesProvidertrue.selectIndex].cuisine}'+' '+'${recipe.recipes[recipesProvidertrue.selectIndex].name}',style: TextStyle(color: Colors.black,fontSize: 24),),
                    Container(
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage('${recipe!.recipes[recipesProvidertrue.selectIndex].image}')
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8),
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration
                        (
                        color: Colors.grey.shade50,
                        border: Border.all(color: Colors.grey.shade100,width: 1),
                        borderRadius: BorderRadius.circular(10)
        
                      ),
                      child: Column(
                        children: [ Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Servings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text('Preparation',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text('Cook',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${recipe.recipes[selectedIndex].servings}'+'people',),
                              Text('${recipe.recipes[selectedIndex].prepTimeMinutes}'+'mins',),
                              Text('${recipe.recipes[selectedIndex].cookTimeMinutes}'+'mins',),
        
                            ],
                          ),
        
                        ],
                      ),
                    ),
        
                   Text( 'Ingredients :',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                   Text( '${recipe.recipes[selectedIndex].ingredients}'),
                    Text( 'Instructions :',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                    Text( '${recipe.recipes[selectedIndex].instructions}'),
                    Text( 'Tags :',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                    Text( '${recipe.recipes[selectedIndex].tags}'),
                    Text( ' CaloriesPerServing:',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                    Text( '${recipe.recipes[selectedIndex].caloriesPerServing}'),
        
        
        
                  ],
                ),
              );
            }
            else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        
        
          }
        ),
      )

    );
  }
}
