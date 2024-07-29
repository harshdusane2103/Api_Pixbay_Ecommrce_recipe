import 'package:api_pixbay/Ecommrce/Modal/Ecommrce_Modal.dart';
import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
import 'package:api_pixbay/Ecommrce/View/ECO_Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    EcommerceProvider ecommerceProvidertrue=Provider.of(context,listen: true);
    EcommerceProvider ecommerceProviderfalse=Provider.of(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Products'),

        ),
        body: SingleChildScrollView(
          child:
          FutureBuilder(
              future: ecommerceProviderfalse.fromMap(),
              builder: (context,snapshot)
              {
                if (snapshot.hasData)
                {
                  EcommerceModal? Eco = snapshot.data;
                  return Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('${recipe!.recipes[recipesProvidertrue.selectIndex].cuisine}'+' '+'${recipe.recipes[recipesProvidertrue.selectIndex].name}',style: TextStyle(color: Colors.black,fontSize: 24),),
                        Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  // fit: BoxFit.cover,
                                  image: NetworkImage('${Eco!.products[selectedIndex].images[0]}')
                              )
                          ),
                        ),
                        SizedBox(height: 10,),

                        Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${Eco!.products[selectedIndex].title}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    Text('${Eco!.products[selectedIndex].rating}'+'⭐',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))

                                  ],
                                ),
                                Text('\$'+'${Eco!.products[selectedIndex].price}',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20)),
                                Text('${Eco!.products[selectedIndex].description}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),
                                Text('Category  : '+'${Eco!.products[selectedIndex].category}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16)),
                                Text('Warranty  : '+'${Eco!.products[selectedIndex].warrantyInformation}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16)),
                                Text('Status  : '+'${Eco!.products[selectedIndex].availabilityStatus}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16)),
                                Text('Stock  : '+'${Eco!.products[selectedIndex].stock}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16)),
                                Text( 'Return Policy  : '+'${Eco!.products[selectedIndex].returnPolicy}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16)),
                                Text( 'Reviews  : '+'${Eco!.products[selectedIndex].reviews}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16)),
                                Text( '# '+'${Eco!.products[selectedIndex].tags}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                 InkWell(
                   onTap: () {
                     CartList.add({
                       'img': Eco!.products[selectedIndex].images[0],
                       'name': Eco!.products[selectedIndex].title,
                       'price': Eco!.products[selectedIndex].price,

                     });

                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartScreen()));
                   },
                   child: Center(
                     child: Container(
                       height: 50,
                       width: 200,
                       decoration: BoxDecoration(
                         color: Colors.greenAccent,
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Center(child: Text('ADD TO CART',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                     ),
                   ),
                 )



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
List CartList=[];