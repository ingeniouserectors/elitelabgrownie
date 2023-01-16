class ModelCartProducts {
  int? qty;
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
  List<String>? images;

  List<String>? videos;
  int? totalcount;


  ///Diamond
  bool? isDiamond;
  String? diamonddetailsId;
  String? lot;
  String? shape;
  String? color;
  String? clarity;
  String? heartsandarrows;
  String? weight;
  String? lab;
  String? cutgrade;
  String? polish;
  String? symmetry;
  String? fluor;
  String? rapaportPrice;
  String? offRap;
  String? pricect;
  String? certificate;
  String? length;
  String? width;
  String? depth;
  String? depthPrecentage;
  String? tablePrecentage;
  String? girdle;
  String? culet;
  String? descriptioncomments;
  String? origin;
  String? memostatus;
  String? inscription;
  String? measurement;
  String? certificateimage;
  String? videolink;
  String? imagelink;
  String? htmllink;
  String? costprice;
  String? markupprice;
  String? pavilionangle;
  String? gridlePercentage;
  String? crownheightPercentage;
  String? pavilionheightPercentage;
  String? crownangle;
  String? labdate;
  String? markup;

  ModelCartProducts(
      {this.entityId,
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
      this.videos,
      this.totalweight,
      this.totalcount,
      this.qty,

      ///Diamond
      this.isDiamond,
      this.diamonddetailsId,
      this.lot,
      this.shape,
      this.color,
      this.clarity,
      this.heartsandarrows,
      this.weight,
      this.lab,
      this.cutgrade,
      this.polish,
      this.symmetry,
      this.fluor,
      this.rapaportPrice,
      this.offRap,
      this.pricect,
      this.certificate,
      this.length,
      this.width,
      this.depth,
      this.depthPrecentage,
      this.tablePrecentage,
      this.girdle,
      this.culet,
      this.descriptioncomments,
      this.origin,
      this.memostatus,
      this.inscription,
      this.measurement,
      this.certificateimage,
      this.videolink,
      this.imagelink,
      this.htmllink,
      this.costprice,
      this.markupprice,
      this.pavilionangle,
      this.gridlePercentage,
      this.crownheightPercentage,
      this.pavilionheightPercentage,
      this.crownangle,
      this.labdate,
      this.markup});

  ModelCartProducts.fromJson(Map<String, dynamic> json) {
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
    try {
      images = json['images'].cast<String>();
    } catch (e) {
      //error
    }

    try {
      videos = json['videos'].cast<String>();
    } catch (e) {
      //error
    }
    totalcount = json['totalcount'];

    ///Diamond
    isDiamond = json['is_diamond'];
    diamonddetailsId = json['diamonddetails_id'];
    lot = json['lot'];
    shape = json['shape'];
    color = json['color'];
    clarity = json['clarity'];
    heartsandarrows = json['heartsandarrows'];
    weight = json['weight'];
    lab = json['lab'];
    cutgrade = json['cutgrade'];
    polish = json['polish'];
    symmetry = json['symmetry'];
    fluor = json['fluor'];
    rapaportPrice = json['rapaport_price'];
    offRap = json['off_rap'];
    pricect = json['pricect'];
    certificate = json['certificate'];
    length = json['length'];
    width = json['width'];
    depth = json['depth'];
    depthPrecentage = json['depth_precentage'];
    tablePrecentage = json['table_precentage'];
    girdle = json['girdle'];
    culet = json['culet'];
    descriptioncomments = json['descriptioncomments'];
    origin = json['origin'];
    memostatus = json['memostatus'];
    inscription = json['inscription'];
    measurement = json['measurement'];
    certificateimage = json['certificateimage'];
    videolink = json['videolink'];
    imagelink = json['imagelink'];
    htmllink = json['htmllink'];
    costprice = json['costprice'];
    markupprice = json['markupprice'];
    pavilionangle = json['pavilionangle'];
    gridlePercentage = json['gridle_percentage'];
    crownheightPercentage = json['crownheight_percentage'];
    pavilionheightPercentage = json['pavilionheight_percentage'];
    crownangle = json['crownangle'];
    labdate = json['labdate'];
    markup = json['markup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['totalcount'] = totalcount;
    data['qty'] = qty;

    ///Diamond
    data['is_diamond'] = isDiamond;
    data['diamonddetails_id'] = diamonddetailsId;
    data['lot'] = lot;
    data['shape'] = shape;
    data['color'] = color;
    data['clarity'] = clarity;
    data['heartsandarrows'] = heartsandarrows;
    data['weight'] = weight;
    data['lab'] = lab;
    data['cutgrade'] = cutgrade;
    data['polish'] = polish;
    data['symmetry'] = symmetry;
    data['fluor'] = fluor;
    data['rapaport_price'] = rapaportPrice;
    data['off_rap'] = offRap;
    data['pricect'] = pricect;
    data['certificate'] = certificate;
    data['length'] = length;
    data['width'] = width;
    data['depth'] = depth;
    data['depth_precentage'] = depthPrecentage;
    data['table_precentage'] = tablePrecentage;
    data['girdle'] = girdle;
    data['culet'] = culet;
    data['descriptioncomments'] = descriptioncomments;
    data['origin'] = origin;
    data['memostatus'] = memostatus;
    data['inscription'] = inscription;
    data['measurement'] = measurement;
    data['certificateimage'] = certificateimage;
    data['videolink'] = videolink;
    data['imagelink'] = imagelink;
    data['htmllink'] = htmllink;
    data['costprice'] = costprice;
    data['markupprice'] = markupprice;
    data['pavilionangle'] = pavilionangle;
    data['gridle_percentage'] = gridlePercentage;
    data['crownheight_percentage'] = crownheightPercentage;
    data['pavilionheight_percentage'] = pavilionheightPercentage;
    data['crownangle'] = crownangle;
    data['labdate'] = labdate;
    data['markup'] = markup;
    return data;
  }
}
