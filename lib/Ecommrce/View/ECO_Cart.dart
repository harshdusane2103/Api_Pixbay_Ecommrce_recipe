import 'package:api_pixbay/Ecommrce/Modal/Ecommrce_Modal.dart';
import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
import 'package:api_pixbay/Ecommrce/View/ECO_Detail.dart';
import 'package:api_pixbay/Ecommrce/View/ECO_Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EcommerceProvider ecommerceProvidertrue =
        Provider.of(context, listen: true);
    EcommerceProvider ecommerceProviderfalse =
        Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) => ProductHomescreen()));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: ecommerceProviderfalse.fromMap(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                EcommerceModal? Eco = snapshot.data;
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      '${Eco!.products[selectedIndex].images[0]}'),
                                )),
                              ),
                            ),
                            Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [

                            Text('${Eco!.products[selectedIndex].title}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                            Text('\$'+'${Eco!.products[selectedIndex].price}',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20)),
                            ],),
                            InkWell(onTap:() {
                              CartList.removeAt(selectedIndex);

                            },
                                child: Icon(Icons.delete))
                          ],
                        ),
                      )
                    ]));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
