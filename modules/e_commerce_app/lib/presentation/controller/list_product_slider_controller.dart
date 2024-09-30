class Data {
  int? _id;
  String? _title;
  String? _shortDes;
  String? _price;
  String? _image;
  int? _productId;
  String? _createdAt;
  String? _updatedAt;

  Data(
      {int? id,
        String? title,
        String? shortDes,
        String? price,
        String? image,
        int? productId,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (shortDes != null) {
      this._shortDes = shortDes;
    }
    if (price != null) {
      this._price = price;
    }
    if (image != null) {
      this._image = image;
    }
    if (productId != null) {
      this._productId = productId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get shortDes => _shortDes;
  set shortDes(String? shortDes) => _shortDes = shortDes;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _shortDes = json['short_des'];
    _price = json['price'];
    _image = json['image'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['short_des'] = this._shortDes;
    data['price'] = this._price;
    data['image'] = this._image;
    data['product_id'] = this._productId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}