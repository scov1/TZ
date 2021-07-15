import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_tz/core/view_model/home_view_model.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'auth/login_view.dart';
import 'detail_view.dart';
import 'widgets/custom_text.dart';

class HomeView extends StatelessWidget {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                    const EdgeInsets.only(top: 100.0, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchProduct(),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Gadgets",
                            textStyle: Constants.regularHeadingText,
                          ),
                          CustomText(
                            text: "See all",
                            textStyle: Constants.regularHeadingText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts()
                    ],
                  ),
                ),
              ),
            floatingActionButton: FloatingActionButton( 
              onPressed: ()async{
                await _auth.signOut();
                Get.to(LoginView());
              },
        child: Icon(Icons.logout),
      ),
            ),
    );
  }

// просто для дизайна
  Widget _searchProduct() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 310,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailView(
                  model: controller.productModel[index],
                ));
               
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Container(
                          height: 220,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                controller.productModel[index].image,
                                fit: BoxFit.cover,
                              ))),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.productModel[index].name,
                      textAlignment: Alignment.bottomLeft,
                      textStyle: Constants.regularHeadingText,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].discription,
                        textAlignment: Alignment.bottomLeft,
                        textStyle: Constants.greyText,
                        maxLine: 1,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: "\$ " + controller.productModel[index].price,
                      textAlignment: Alignment.bottomLeft,
                      textStyle: Constants.redLabelText,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}