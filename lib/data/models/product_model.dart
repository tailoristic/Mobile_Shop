class ProductModel {
  final String name;
  final String price; // PRICE SHOULD BE IN INT OR DOUBLE
  final String image;
  final int productID;
  ProductModel({
    this.name,
    this.price,
    this.image,
    this.productID,
  });

  ProductModel.fromDynamic(dynamic map)
      : this.name = map['name'],
        this.price = map['price'],
        this.image = map['image'],
        this.productID = map['productID'];

  ProductModel.fromMap(Map<String, dynamic> map)
      : this.name = map['name'],
        this.price = map['price'],
        this.image = map['immage'],
        this.productID = map['productID'];
}
