
import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
import 'package:api_pixbay/Pixbay/Modal/modal.dart';
import 'package:api_pixbay/Pixbay/Provider/Api_Provider.dart';
import 'package:api_pixbay/Pixbay/View/detail.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

TextEditingController txtSearch = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvidertrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderfalse =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pixbay',
            style: TextStyle(color: Colors.green, fontSize: 30),
          ),

        ),
        body:
        Column(
          children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      child:
                      TextField(
                        onSubmitted: (value) {
                          homeProviderfalse.SearchImage(txtSearch.text);

                        },

                        controller: txtSearch,
                        decoration: InputDecoration(

                          prefixIcon: Icon(Icons.search),
                          label: Text('Search Images'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        homeProviderfalse.SearchImage(txtSearch.text);
                      },
                      icon: Icon(Icons.search)),
                ],
              ),
            FutureBuilder(
              future: Provider.of<HomeProvider>(context, listen: false)
                  .fromMap(homeProvidertrue.search),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  PixabayModal? search = snapshot.data;

                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: search!.hits.length,
                        itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          selectedIndex=index;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PixbayDetailScreen()));
                        },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 200,
                            width: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${search.hits[index].webformatURL}'),),),
                          ),
                        )),
                  );
                }
                else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
            ],

        )

        );
  }
}
