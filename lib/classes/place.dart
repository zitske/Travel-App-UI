import 'package:latlng/latlng.dart';

import 'package:places_discover/classes/categories.dart';

class Place {
  String? name;
  String? state;
  double? rate;
  LatLng? coord;
  double? price;
  String? imageUrl;
  int? id;
  bool? liked;
  int? members;
  Categories? category;
  Place({
    this.name,
    this.state,
    this.rate,
    this.coord,
    this.price,
    this.imageUrl,
    this.id,
    this.liked,
    this.members,
    this.category,
  });
}
