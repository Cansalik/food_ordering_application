import 'package:food_ordering_application/data/models/shopping_cart_foods.dart';

class ShoppingCartResponse
{
  List<ShoppingCartFoods> foods;
  int success;


  ShoppingCartResponse({
    required this.foods,
    required this.success});

  factory ShoppingCartResponse.fromJosn(Map<String,dynamic>json)
  {
    var jsonArray = json['sepet_yemekler'] as List;
    var success = json['success'] as int;

    var foods = jsonArray.map((e) => ShoppingCartFoods.fromJson(e)).toList();
    return ShoppingCartResponse(foods: foods, success: success);
  }
}