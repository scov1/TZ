import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_tz/model/product_model.dart';
import '../constants.dart';
import 'widgets/custom_text.dart';

class DetailView extends StatelessWidget {

  ProductModel model;
  DetailView({this.model});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Image.network(
                      model.image,
                      fit: BoxFit.fitHeight,
                    )),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        textAlignment: Alignment.bottomLeft,
                        textStyle: Constants.boldHeadingText,
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "Size"),
                                Container(
                                  width: 30,
                                  height: 20,
                                  child: CustomText(text: model.sized),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      CustomText(
                        text: "Details",
                        textAlignment: Alignment.bottomLeft,
                        textStyle: Constants.regularHeadingTextBold,
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: CustomText(
                            text: model.discription,
                            textAlignment: Alignment.bottomLeft,
                            textStyle: Constants.regularHeadingDescText,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: "PRICE",
                                textStyle: Constants.greyLabelText,
                              ),
                              SizedBox(height: 5),
                              CustomText(
                                text: "\$" + model.price,
                                textStyle: Constants.greenRegularText,
                              ),
                            ],
                          ),
                          FloatingActionButton( 
                            onPressed: ()async{
                              await FirebaseFirestore.instance.collection('Products').doc(model.productId).delete();       
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
