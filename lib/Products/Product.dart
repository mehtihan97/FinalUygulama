class Product{
  String name;
  String description;
  int price;
  String image;
  Product(String name,String description,int price){
    this.name=name;
    this.description=description;
    this.price=price;
  }
  Product.List(String name,int price,String image){
    this.name=name;
    this.price=price;
    this.image=image;
  }
}