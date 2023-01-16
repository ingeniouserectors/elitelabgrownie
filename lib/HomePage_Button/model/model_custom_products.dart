class ModelCustomProducts {
  dynamic entityId;
  dynamic sku;
  dynamic name;
  dynamic description;
  dynamic isInStock;
  dynamic finalprice;
  dynamic level;
  dynamic metaltype;
  dynamic metalcolor;
  dynamic quailty;
  dynamic totalweight;
  dynamic categoryvalue;
  dynamic imageUrl;
  dynamic qty;
  bool? isCart;
  List<String>? images;

  List<String>? videos;
  int? totalcount;

  ModelCustomProducts(
      {this.entityId,
      this.isCart,
      this.sku,
      this.name,
      this.description,
      this.isInStock,
      this.finalprice,
      this.level,
      this.metaltype,
      this.metalcolor,
      this.quailty,
      this.categoryvalue,
      this.imageUrl,
      this.images,
      this.qty,
      this.videos,
      this.totalweight,
      this.totalcount});

  ModelCustomProducts.fromJson(Map<String, dynamic> json) {
    isCart = json['isCart'];
    entityId = json['entity_id'];
    sku = json['sku'];
    name = json['name'];
    description = json['description'];
    isInStock = json['is_in_stock'];
    finalprice = json['finalprice'];
    level = json['level'];
    metaltype = json['metaltype'];
    metalcolor = json['metalcolor'];
    quailty = json['quailty'];
    categoryvalue = json['categoryvalue'];
    imageUrl = json['image_url'];
    totalweight = json['totalweight'];
    qty = json['qty'];
    images = json['images'].cast<String>();

    videos = json['videos'].cast<String>();
    totalcount = json['totalcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isCart'] = isCart;
    data['entity_id'] = entityId;
    data['sku'] = sku;
    data['name'] = name;
    data['description'] = description;
    data['is_in_stock'] = isInStock;
    data['finalprice'] = finalprice;
    data['level'] = level;
    data['metaltype'] = metaltype;
    data['metalcolor'] = metalcolor;
    data['quailty'] = quailty;
    data['categoryvalue'] = categoryvalue;
    data['image_url'] = imageUrl;
    data['totalweight'] = totalweight;
    data['images'] = images;
    data['videos'] = videos;
    data['qty'] = qty;
    data['totalcount'] = totalcount;
    return data;
  }
}
