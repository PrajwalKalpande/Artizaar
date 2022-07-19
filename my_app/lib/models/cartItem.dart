import './artwork.dart';

class CartItem {
  int? cartID;
  String? username;
  String? art;
  String? status;
 String? artworkID;
  String? material;
  Details? details;
 Size? size;
  bool? forSell;
  int? maxbid;
  int? userbid;
 
  DateTime? createdAt;
  String? endsOn;
  String? title;
  

  CartItem(
      { this.cartID,
      this.title,
      this.username,
      this.art,
      this.status,
 this.size,
      this.material,
      this.details,
    this.maxbid,
      this.forSell,
    this.artworkID,
      this.userbid,
 
      this.createdAt,
      this.endsOn,
     });

  CartItem.fromJson(Map<String, dynamic> json) {
    cartID = int.parse(json['_id']);
    username = json['username'];
    art = json['art'];
  artworkID = json['artworkID'];
    title = json['title'];
    status = json['status'];
   
    material = json['material'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
    forSell = json['forSell'];
    maxbid = json['maxbid'];
    userbid = json['userbid'];
  size = Size.fromJson(json['size']);
    
    createdAt = DateTime.parse(json['createdAt']);
    endsOn = (json['endsOn']);
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.cartID.toString();
 data['size'] = this.size!.toJson();
    data['title'] = this.title;
    data['username'] = this.username;
    data['art'] = this.art;
    data['status'] = this.status;
 data['artworkID'] =  this.artworkID;
   
    data['forSell'] = this.forSell;
    data['maxbid'] = this.maxbid;
    data['userbid'] = this.userbid;
   
    
    data['createdAt'] = this.createdAt.toString();
    data['endsOn'] = this.endsOn;
  
    return data;
  }
}

 
