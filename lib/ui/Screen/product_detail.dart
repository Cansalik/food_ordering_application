import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_ordering_application/data/models/foods.dart';
import 'package:food_ordering_application/ui/Cubit/food_cubit.dart';
import 'package:food_ordering_application/ui/utils/custom_colors.dart';

class ProductDetail extends StatefulWidget {
  Foods foods;
  ProductDetail({super.key, required this.foods});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double raiting = 0.0;
  int counter = 0,total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.close,size: 36,)),
        title: const Center(child: Text("Ürün Detayı",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)),
        actions: const <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.favorite,size: 30,color: CustomColors.iconColor,),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: raiting,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (newRating) {
                      setState(() {
                        raiting = newRating;
                      });
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.foods.yemek_resim_adi}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.foods.yemek_fiyat,style: TextStyle(color: CustomColors.textColor,fontSize: 36),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.foods.yemek_adi,style: TextStyle(color: CustomColors.titileColor,fontSize: 36,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      counter = counter - 1;
                      total = int.parse(widget.foods.yemek_fiyat) * counter;
                    });
                  },
                  child: Icon(Icons.indeterminate_check_box_sharp,size: 128,color: CustomColors.iconColor,),
                ),
                Text(counter.toString(),style: TextStyle(color: CustomColors.titileColor,fontSize: 36,fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      counter = counter + 1;
                      total = int.parse(widget.foods.yemek_fiyat) * counter;
                    });
                  },
                  child: Icon(Icons.add_box_sharp,size: 128,color: CustomColors.iconColor,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[300]
                    ),
                    child: const Center(child: Text("25-35 dk.")),
                  ),
                  Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[300]
                    ),
                    child: const Center(child: Text("Ücretsiz Teslimat")),
                  ),
                  Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[300]
                    ),
                    child: const Center(child: Text("İndirim %10")),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Toplam: ${total.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: CustomColors.titileColor),),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.backColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                          ),
                        ),
                        onPressed: (){
                          try
                          {
                            context.read<FoodCubit>().addFoodToCart(widget.foods.yemek_adi, widget.foods.yemek_resim_adi, int.parse(widget.foods.yemek_fiyat), counter, "cansalik");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: CustomColors.backColor,
                                content: Text("Sepete Eklendi",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                            Navigator.pop(context);
                          }
                          catch(e)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: CustomColors.backColor,
                                content: Text("Bir Hata Oluştu, Tekrar Deneyin.",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                          }
                        },
                        child: const Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
