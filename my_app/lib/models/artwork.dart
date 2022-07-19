class Artwork {
  String? sId;
  String? username;
  String? art;
  String? profilePicture;
  Size? size;
  String? material;
  Details? details;
  String? description;
  bool? forSell;
  int? price;
  int? currentbid;
  List<String>? tags;
  int? likes;
  List<String>? comments;
  int? shares;
  int? saves;
  String? createdAt;
  String? updatedAt;
  String? title;
  int? iV;
  
  Artwork(
      {this.sId,
      this.title,
      this.username,
      this.art,
      this.profilePicture,
      this.size,
      this.material,
      this.details,
      this.description,
      this.forSell,
      this.price,
      this.currentbid,
      this.tags,
      this.likes,
      this.comments,
      this.shares,
      this.saves,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Artwork.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    art = json['art'];
    description = json['description'];
    title = json['title'];
    profilePicture = json['profilePicture'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    material = json['material'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description']= this.description;
    data['title'] = this.title;
    data['username'] = this.username;
    data['art'] = this.art;
    data['profilePicture'] = this.profilePicture;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    data['material'] = this.material;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    data['forSell'] = this.forSell;
    data['price'] = this.price;
    data['currentbid'] = this.currentbid;
    if (this.tags != null) {
      data['tags'] = this.tags!.toList();
    }
    data['likes'] = this.likes;
    if (this.comments != null) {
      data['comments'] = this.comments!.toList();
    }
    data['shares'] = this.shares;
    data['saves'] = this.saves;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Size {
  int? height;
  int? width;

  Size({this.height, this.width});

  Size.fromJson(Map<String, dynamic> json) {
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

class Details {
  String? subject;
  String? medium;

  Details({this.subject, this.medium});

  Details.fromJson(Map<String, dynamic> json) {
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