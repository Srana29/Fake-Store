import 'package:flutter/material.dart';
import 'package:internshala_assignment/model/product_list_class.dart';
import 'package:internshala_assignment/screens/product_detail_page.dart';

class Search extends SearchDelegate {

  final List<ProductListClass> productList;

  Search(this.productList);




  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {
        query='';
      },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      Navigator.pop(context);
    },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final suggestionList = query.isEmpty ?
    productList : productList.where((element) =>
        element.title.toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ProductDetailPage(productListClass: suggestionList[index],)));
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
                    child: Image.network(suggestionList[index].image,height: 80,width: 80,),

                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(suggestionList[index].title.length >30 ? '${suggestionList[index].title.substring(0,31)}....' : suggestionList[index].title,
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$ ${suggestionList[index].price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                              Row(
                                children: [
                                  Text(suggestionList[index].rating.rate.toString(),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final suggestionList = query.isEmpty ?
    productList : productList.where((element) =>
        element.title.toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ProductDetailPage(productListClass: suggestionList[index],)));
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
                    child: Image.network(suggestionList[index].image,height: 80,width: 80,),

                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(suggestionList[index].title.length >30 ? '${suggestionList[index].title.substring(0,31)}....' : suggestionList[index].title,
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$ ${suggestionList[index].price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                              Row(
                                children: [
                                  Text(suggestionList[index].rating.rate.toString(),
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
    );
  }

}