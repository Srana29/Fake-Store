import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internshala_assignment/model/product_list_class.dart';
import 'package:internshala_assignment/screens/product_detail_page.dart';
import 'package:internshala_assignment/screens/search_product.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<ProductListClass> productList;
  bool isLoading = true;

  getProductData() async {
    String url = "https://fakestoreapi.com/products";

    Response response = await get(Uri.parse(url));
    List jsonResponse = jsonDecode(response.body);

    setState(() {

      productList = jsonResponse.map((data) => ProductListClass.fromJson(data)).toList();
      isLoading= false;
    });
  }



  @override
  void initState() {
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(productList));
            },
                icon: const Icon(Icons.search))
          ],
          title: const Text('Fake Store'),),
        body: isLoading ? const Center(child: CircularProgressIndicator()) :
        WillPopScope(
          onWillPop: () async {
            return await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Do you really want to exist the app ?"),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("No"),
                    ),
                    ElevatedButton(
                      onPressed: () => exit(0),
                      child: const Text("Yes"),
                    ),
                  ],
                ));
          },
          child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        ProductDetailPage(productListClass: productList[index],)));
                  },
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0,10)
                      )],
                    ),
                    child: Row(
                      children: [
                        Container(

                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(productList[index].image,height: 80,width: 80,),

                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(productList[index].title.length >30 ? '${productList[index].title.substring(0,31)}....' : productList[index].title,
                                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                                const SizedBox(height: 16,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('\$ ${productList[index].price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                                    Row(
                                      children: [
                                        Text(productList[index].rating.rate.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                        const SizedBox(width: 1,),
                                        const Icon(Icons.star,color: Colors.orangeAccent,),
                                      ],
                                    )
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
          ),
        ),
      ),
    );
  }
}
