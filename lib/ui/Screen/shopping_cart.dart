import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/data/models/shopping_cart_foods.dart';
import 'package:food_ordering_application/ui/Cubit/shoppingcart_cubit.dart';
import 'package:food_ordering_application/ui/Cubit/shoppingcartlist_cubit.dart';
import 'package:food_ordering_application/ui/Screen/navigation_bar.dart';
import 'package:food_ordering_application/ui/utils/custom_colors.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {


  @override
  void initState() {
    context.read<ShoppingCartListCubit>().loadShoppingCart("cansalik");
    super.initState();
  }
  int totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeBottomNavigationBar()));
        }, icon: Icon(Icons.close,size: 36,)),
        title: Text("Sepetim",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 525,
                child: BlocBuilder<ShoppingCartListCubit,List<ShoppingCartFoods>>(
                  builder: (context,foodList){
                    if(foodList.isNotEmpty){
                      totalPrice = foodList.fold<int>(0, (previousValue, food) {
                        return previousValue + (int.parse(food.yemek_fiyat) * int.parse(food.yemek_siparis_adet));
                      });
                      return ListView.builder(
                          itemCount: foodList.length,
                          itemBuilder: (context ,index)
                          {
                            var food = foodList[index];
                            return Card(
                              elevation: 5,
                              child: Container(
                                color: Colors.white,
                                child: SizedBox(
                                  height: 128,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",width: 128,height: 128,),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(food.yemek_adi,style: TextStyle(color: CustomColors.titileColor,fontWeight: FontWeight.bold,fontSize: 24),),
                                          RichText(
                                            text:  TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: "Fiyat: ",
                                                  style: TextStyle(color: CustomColors.textColor, fontSize: 18),
                                                ),
                                                TextSpan(
                                                  text: '${food.yemek_fiyat}',
                                                  style: TextStyle(color: CustomColors.textColor, fontWeight: FontWeight.bold, fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text("Adet: ${food.yemek_siparis_adet}",style: TextStyle(color: Colors.grey,),),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: ()
                                            {
                                              try
                                              {
                                                context.read<ShoppingCartCubit>().deleteCart(int.parse(food.sepet_yemek_id), food.kullanici_adi);
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    backgroundColor: CustomColors.backColor,
                                                    content: Text("Sepetten Çıkarıldı",
                                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                    ),
                                                    duration: Duration(milliseconds: 500),
                                                  ),
                                                );
                                              }
                                              catch (e)
                                              {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    backgroundColor: CustomColors.backColor,
                                                    content: Text("Bir hata oluştu, Tekrar Deneyin",
                                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                    ),
                                                    duration: Duration(milliseconds: 500),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(right: 10.0,top: 10.0),
                                              child: Icon(Icons.delete,size: 48,color: CustomColors.backColor,),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 10.0,right: 10.0),
                                            child: Text("₺ ${(int.parse(food.yemek_siparis_adet) * int.parse(food.yemek_fiyat))}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: CustomColors.textColor),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    }
                    else
                    {
                      return  const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Sepetiniz Boş",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Gönderim Ücreti",style: TextStyle(color: Colors.blueGrey),),
                      Spacer(),
                      Text("₺ 0",style: TextStyle(color: Colors.blueGrey),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Toplam: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                      Text("₺ $totalPrice",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber
                      ),
                      child: const Text("Sepeti Onayla",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
