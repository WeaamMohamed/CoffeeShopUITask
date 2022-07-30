class CoffeeProductModel{
  double rate;
  int reviews;
  String address;
  bool isLoved;
  String productImage;
  CoffeeProductModel({
    required this.rate,
    required this.reviews,
    required this.address,
    this.isLoved = false,
    required this.productImage

});
}