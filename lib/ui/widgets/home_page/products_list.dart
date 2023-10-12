import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/data/models/foods.dart';
import 'package:food_ordering_application/data/repositories/food_repository.dart';
import 'package:food_ordering_application/ui/Cubit/foodslist_cubit.dart';
import 'package:food_ordering_application/ui/Screen/product_detail.dart';
import 'package:food_ordering_application/ui/utils/custom_colors.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {

  FoodRepository foodRepository = FoodRepository();


  @override
  void initState() {
    context..read<FoodsListCubit>().loadFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodsListCubit,List<Foods>>(
      builder: (context,foodList){
        if(foodList.isNotEmpty){
              return Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Column(
                  children: [
                    Container(
                      height: 430,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // İki sütunlu bir grid
                            crossAxisSpacing: 10.0, // Sütunlar arası boşluk
                            mainAxisSpacing: 10.0, // Satırlar arası boşluk
                            childAspectRatio: 2 / 2.7
                        ),
                        itemCount: foodList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var food = foodList[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(foods: food,)));
                            },
                            child: Card(
                              elevation: 10,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_sharp,size: 30,),),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",width: 100,height: 100,),
                                    ),
                                    Text(food.yemek_adi, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                    const SizedBox(height: 5,),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.motorcycle,color: CustomColors.iconColor,),
                                        Text("Ücretsiz Gönderim",style: TextStyle(fontSize: 12,color: Colors.grey),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 18.0),
                                          child: Text("${food.yemek_fiyat} ₺",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: CustomColors.titileColor),),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 18.0),
                                          child: Icon(Icons.add_box_rounded,color: CustomColors.buttonColor,size: 30,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
        }else{
          return const Center();
        }
      },
    );
  }
}
