import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{

    final CollectionReference _collectionProducts = 
      FirebaseFirestore.instance.collection("Products");

    Future<List<QueryDocumentSnapshot>> getProducts() async{
      var value = await _collectionProducts.get();
      return value.docs;
      
    }
}