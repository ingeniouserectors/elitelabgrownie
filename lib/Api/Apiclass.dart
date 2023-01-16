
class DaimondList {
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

  DaimondList(
      {this.diamonddetailsId,
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

  DaimondList.fromJson(Map<String, dynamic> json) {
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
    data['diamonddetails_id'] = this.diamonddetailsId;
    data['lot'] = this.lot;
    data['shape'] = this.shape;
    data['color'] = this.color;
    data['clarity'] = this.clarity;
    data['heartsandarrows'] = this.heartsandarrows;
    data['weight'] = this.weight;
    data['lab'] = this.lab;
    data['cutgrade'] = this.cutgrade;
    data['polish'] = this.polish;
    data['symmetry'] = this.symmetry;
    data['fluor'] = this.fluor;
    data['rapaport_price'] = this.rapaportPrice;
    data['off_rap'] = this.offRap;
    data['pricect'] = this.pricect;
    data['certificate'] = this.certificate;
    data['length'] = this.length;
    data['width'] = this.width;
    data['depth'] = this.depth;
    data['depth_precentage'] = this.depthPrecentage;
    data['table_precentage'] = this.tablePrecentage;
    data['girdle'] = this.girdle;
    data['culet'] = this.culet;
    data['descriptioncomments'] = this.descriptioncomments;
    data['origin'] = this.origin;
    data['memostatus'] = this.memostatus;
    data['inscription'] = this.inscription;
    data['measurement'] = this.measurement;
    data['certificateimage'] = this.certificateimage;
    data['videolink'] = this.videolink;
    data['imagelink'] = this.imagelink;
    data['htmllink'] = this.htmllink;
    data['costprice'] = this.costprice;
    data['markupprice'] = this.markupprice;
    data['pavilionangle'] = this.pavilionangle;
    data['gridle_percentage'] = this.gridlePercentage;
    data['crownheight_percentage'] = this.crownheightPercentage;
    data['pavilionheight_percentage'] = this.pavilionheightPercentage;
    data['crownangle'] = this.crownangle;
    data['labdate'] = this.labdate;
    data['markup'] = this.markup;
    return data;
  }
}
