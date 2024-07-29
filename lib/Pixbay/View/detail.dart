import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
import 'package:api_pixbay/Pixbay/Modal/modal.dart';
import 'package:api_pixbay/Pixbay/Provider/Api_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
class PixbayDetailScreen extends StatelessWidget {
  const PixbayDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvidertrue=Provider.of(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Set WallPaper'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            height: 600,
            width: 400,
            color: Colors.grey.shade100,
            child: Column(
              children: [
                FutureBuilder(
                  future: Provider.of<HomeProvider>(context, listen: false)
                      .fromMap(homeProvidertrue.search),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      PixabayModal? search = snapshot.data;

                      return Flexible(
                        child:
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${search!.hits[selectedIndex].webformatURL}'),),),
                          ),
                        ),

                      );

                    }
                    else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                InkWell(
                    onTap:() async {

                      await AsyncWallpaper.setWallpaperFromFile(
                        filePath:homeProvidertrue.pixabayModal!.hits[selectedIndex].webformatURL ,
                        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                        goToHome: false,
                        toastDetails: ToastDetails.success(),
                        errorToastDetails: ToastDetails.error(),
                      );

                    },child: Icon(Icons.wallpaper,color: Colors.black,size: 40,)),
              ],
            ),
          )




        ],

      )
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:async_wallpaper/async_wallpaper.dart';
// import 'package:api_pixbay/Pixbay/Modal/modal.dart';
// import 'package:api_pixbay/Pixbay/Provider/Api_Provider.dart';
// import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
//
// class PixbayDetailScreen extends StatelessWidget {
//   final int selectedIndex;
//
//   const PixbayDetailScreen({super.key, required this.selectedIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     // Ensuring Provider is properly used
//     HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: true);
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Set WallPaper'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 50),
//           Container(
//             height: 600,
//             width: 400,
//             color: Colors.grey.shade100,
//             child: Column(
//               children: [
//                 FutureBuilder<PixabayModal?>(
//                   future: homeProvider.fromMap(homeProvider.search),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Error: ${snapshot.error}'),
//                       );
//                     } else if (!snapshot.hasData || snapshot.data!.hits.isEmpty) {
//                       return Center(
//                         child: Text('No data found'),
//                       );
//                     } else {
//                       PixabayModal search = snapshot.data!;
//                       String imageUrl = search.hits[selectedIndex].webformatURL;
//
//                       return Flexible(
//                         child: Center(
//                           child: Container(
//                             margin: EdgeInsets.all(10),
//                             height: 400,
//                             width: 400,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(imageUrl),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     try {
//                       String filePath = homeProvider.pixabayModal!.hits[selectedIndex].webformatURL;
//                       bool result = await AsyncWallpaper.setWallpaperFromFile(
//                         filePath: filePath,
//                         wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
//                         goToHome: true,
//                         toastDetails: ToastDetails.success(),
//                         errorToastDetails: ToastDetails.error(),
//                       );
//
//                       if (result) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Wallpaper set successfully!')),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Failed to set wallpaper.')),
//                         );
//                       }
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Error: $e')),
//                       );
//                     }
//                   },
//                   child: Icon(Icons.wallpaper, color: Colors.black, size: 40),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

