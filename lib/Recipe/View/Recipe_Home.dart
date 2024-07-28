import 'package:api_pixbay/Recipe/Modal/recipe_modal.dart';
import 'package:api_pixbay/Recipe/View/Detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/provider_recipe.dart';

class RecipeHomeScreen extends StatelessWidget {
  const RecipeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesProvider recipesProvidertrue =
        Provider.of<RecipesProvider>(context, listen: true);
    RecipesProvider recipesProviderfalse =
        Provider.of<RecipesProvider>(context, listen: false);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Recipes'),
        // ),
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image/111.jpg'),
                ),
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.menu),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Get Cooking Today!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              // onSubmitted: (value) {
              //   homeProviderfalse.SearchImage(txtSearch.text);
              //
              // },
              //
              // controller: txtSearch,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                label: Text('Search Today recipe'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box(name: 'All', width: 40),
                box(name: 'Main Course', width: 100),
                box(name: 'Breakfast', width: 90),
                box(name: 'Soup', width: 50),
                box(name: 'Pizza', width: 60),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: recipesProviderfalse.fromMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    RecipesModal? recipe = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              recipesProvidertrue.recipesModal!.recipes.length,
                              (index) => InkWell(
                                    onTap: () {
                                      recipesProviderfalse.selectedIndex(index);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 500,
                                      width: 280,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  '${recipe!.recipes[index].image}'))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 300,
                                            ),
                                            Text(
                                              recipe!.recipes[index].cuisine,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              recipe!.recipes[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white38,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    '${recipe!.recipes[index].cookTimeMinutes}' +
                                                        'mins',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white38,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    '${recipe!.recipes[index].reviewCount}' +
                                                        'Views',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    ));
  }

  Container box({required String name, required double width}) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Center(
          child: Text(
        name,
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
