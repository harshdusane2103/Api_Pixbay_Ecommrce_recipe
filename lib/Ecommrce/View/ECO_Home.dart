import 'package:api_pixbay/Ecommrce/Modal/Ecommrce_Modal.dart';
import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
import 'package:api_pixbay/Ecommrce/View/ECO_Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductHomescreen extends StatelessWidget {
  const ProductHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    EcommerceProvider ecommerceProvidertrue=Provider.of(context,listen: true);
    EcommerceProvider ecommerceProviderfalse=Provider.of(context,listen: false);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
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
              'Get A NEW ONE!',
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
                label: Text('Search Product'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  box(name: 'All', width: 40),
                  box(name: 'Makeup ', width: 100),
                  box(name: 'Fernictture', width: 90),
                  box(name: 'Vegtables', width: 90),
                  box(name: 'chair', width: 60),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder(
                future: ecommerceProviderfalse.fromMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    EcommerceModal? Eco = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              ecommerceProvidertrue.ecommerceModal!.products.length,
                              (index) => InkWell(
                                    onTap: () {
                                      selectedIndex=index;
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 600,
                                      width: 280,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  '${Eco!.products[index].images[0]}'))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 350,),
                                           Container(
                                             height: 210,
                                             width: 290,
                                             decoration: BoxDecoration(
                                               color: Colors.black12
                                             ),
                                             child: SingleChildScrollView(
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   SizedBox(height: 40,),
                                               
                                               Text(
                                                 Eco!.products[index].title,
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 30,
                                                     fontWeight: FontWeight.bold),
                                               ),
                                               SizedBox(
                                                 height: 5,
                                               ),
                                               Text(
                                                 Eco!.products[index].price.toString(),
                                                 style: TextStyle(
                                                     color: Colors.amber,
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
                                                           '${Eco!.products[index].rating}' +
                                                               ' ⭐',
                                                           style: TextStyle(
                                                               color: Colors.white,fontWeight: FontWeight.bold),
                                                         )),
                                                   ),
                                                   SizedBox(
                                                     width: 5,
                                                   ),
                                                   // Container(
                                                   //   height: 40,
                                                   //   width: 80,
                                                   //   decoration: BoxDecoration(
                                                   //     color: Colors.white38,
                                                   //     borderRadius:
                                                   //         BorderRadius.circular(
                                                   //             20),
                                                   //   ),
                                                   //   child: Center(
                                                   //       child: Text(
                                                   //     '${Eco!.products[index].reviews}' +
                                                   //         'Views',
                                                   //     style: TextStyle(
                                                   //         color: Colors.black),
                                                   //   )),
                                                   // ),
                                                 ],
                                               ),
                                               
                                                ],
                                                                                           ),
                                             )

                                        ),]
                                      ),
                                    ),
                                  ))
                          ) ],
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
}

Container box({required String name, required double width}) {
  return Container(
    margin: EdgeInsets.only(right: 2),
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
