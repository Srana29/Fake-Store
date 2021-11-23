import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshala_assignment/model/product_list_class.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailPage extends StatefulWidget {

  final ProductListClass productListClass;
  const ProductDetailPage( {required this.productListClass,Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        backgroundColor:context.canvasColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                child: Image.network(widget.productListClass.image,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/2.3,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.productListClass.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(widget.productListClass.rating.rate.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black
                              ),
                            ),
                            //SizedBox(width: 1,),
                            const Icon(Icons.star,color: Colors.orangeAccent,size: 30,),
                          ],
                        ),
                        Text('Stock:${widget.productListClass.rating.count.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.productListClass.description,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            splashColor: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {},
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 75),
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              child: const Text(
                                "BUY",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text('\$ ${widget.productListClass.price.toString()}',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
