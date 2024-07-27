

import 'package:api_pixbay/Pixbay/API/Helper.dart';
import 'package:api_pixbay/Pixbay/Modal/modal.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier
{
  PixabayModal? pixabayModal;
  String search="";

  void SearchImage(String img)
  {
    search = img;
    notifyListeners();
  }

  Future<PixabayModal?> fromMap(String img)
  async {
    final data = await ApiHelper.apihelper.fetchApiData(img);
    pixabayModal=PixabayModal.fromJson(data);
    return pixabayModal;
  }
}