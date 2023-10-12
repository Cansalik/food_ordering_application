import 'package:food_ordering_application/data/models/foods.dart';

class FoodsResponse
{
  List<Foods> foods;
  int success;

  FoodsResponse({
    required this.foods,
    required this.success});

  factory FoodsResponse.fromJosn(Map<String,dynamic>json)
  {
    var jsonArray = json['yemekler'] as List;
    var success = json['success'] as int;

    var foods = jsonArray.map((e) => Foods.fromJson(e)).toList();

    return FoodsResponse(foods: foods, success: success);
  }


}