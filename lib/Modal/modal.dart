

class PixabayModal {
  late  List<Hit> hits;

  PixabayModal({required this.hits});
  factory PixabayModal.fromJson(Map m1)
  {
    return PixabayModal(hits: (m1['hits'] as List).map((e) =>Hit.fromJson(e)).toList(),);
  }
  
}

class Hit {
  late int user_id;
  late String user, webformatURL, userImageURL, previewURL;

  Hit(
      {required this.user_id,
        required this.user,
        required this.webformatURL,
        required this.userImageURL,
        required  this.previewURL});
  factory Hit.fromJson(Map m1)
  {
    return Hit(user_id: m1['user_id'], user: m1['user'], webformatURL: m1['webformatURL'], userImageURL: m1['userImageURL'], previewURL: m1['previewURL']);
  }

}
