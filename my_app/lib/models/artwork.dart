class ArtworkModel {
  String? username;
  String? art;
  String? profilePicture;
  SizeModel? size;
  String? material;
  DetailsModel? details;
  bool? forSell;
  int? price;
  int? currentbid;
  List<String>? tags;
  int? likes;
  List<String>? comments;
  int? shares;
  int? saves;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  
  ArtworkModel(
      {this.username,
      this.art,
      this.profilePicture,
      this.size,
      this.material,
      this.details,
      this.forSell,
      this.price,
      this.currentbid,
      this.tags,
      this.likes,
      this.comments,
      this.shares,
      this.saves,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ArtworkModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    art = json['art'];
    profilePicture = json['profilePicture'];
    size = json['size'] != null ? new SizeModel.fromJson(json['size']) : null;
    material = json['material'];
    details =
        json['details'] != null ? new DetailsModel.fromJson(json['details']) : null;
    forSell = json['forSell'];
    price = json['price'];
    currentbid = json['currentbid'];
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    likes = json['likes'];
    if (json['comments'] != null) {
      comments = <String>[];
      json['comments'].forEach((v) {
        comments!.add(v);
      });
    }
    shares = json['shares'];
    saves = json['saves'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['art'] = this.art;
    data['profilePicture'] = this.profilePicture;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    data['material'] = this.material;
    if (this.details != null) {
      data['details'] = this.details ;
    }
    data['forSell'] = this.forSell;
    data['price'] = this.price;
    data['currentbid'] = this.currentbid;
    if (this.tags != null) {
      data['tags'] = this.tags ;
    }
    data['likes'] = this.likes;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v).toList();
    }
    data['shares'] = this.shares;
    data['saves'] = this.saves;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SizeModel {
  int? height;
  int? width;

  SizeModel({this.height, this.width});

  SizeModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}

class DetailsModel {
  String? subject;
  String? medium;

  DetailsModel({this.subject, this.medium});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['medium'] = this.medium;
    return data;
  }
}
//INSTANCE OF ABOVE CLASS
// {
//     "username": "batman",
//     "art": "Artwork",
//     "profilePicture": "https://firebasestorage.googleapis.com/v0/b/artwork-gallery-ab602.appspot.com/o/images%2Fbeach.jpeg?alt=media&token=76c27891-0904-4b5e-82d2-ed97329a9cad",
//     "size": {
//         "height": 18,
//         "width": 24
//     },
//     "material": "Canvas",
//     "details": {
//         "subject": "Nature",
//         "medium": "Oil Painting"
//     },
//     "forSell": true,
//     "price": 1000,
//     "currentbid": 0,
//     "tags": [],
//     "likes": 0,
//     "comments": [],
//     "shares": 0,
//     "saves": 0,
//     "_id": "62b4638335debed56326bdad",
//     "createdAt": "2022-06-23T12:58:43.408Z",
//     "updatedAt": "2022-06-23T12:58:43.408Z",
//     "__v": 0
// }