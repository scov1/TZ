
class ProductModel{
  
  String productId,name,image,discription,price,sized;

  ProductModel({this.name,this.discription,this.image,this.price,this.sized,this.productId});


  ProductModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return ;
    }

    name = map['name'];
    discription = map['discription'];
    image = map['image'];
    price = map['price'];
    sized = map['sized'];
    productId = map['productId'];
  }

  toJson(){
    return {
      'name' : name,
      'discription' : discription,
      'image' : image,
      'price' : price,
      'sized' : sized,
      'productId' : productId
    };
  }
}