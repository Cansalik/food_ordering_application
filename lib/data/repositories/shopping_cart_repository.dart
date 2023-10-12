import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_ordering_application/data/models/shopping_cart_foods.dart';
import 'package:food_ordering_application/data/models/shopping_cart_response.dart';

class ShoppingCartRepository
{

  List<ShoppingCartFoods> parseFoods(String response)
  {
    return ShoppingCartResponse.fromJosn(json.decode(response)).foods;
  }

  Future<List<ShoppingCartFoods>> loadShoppingCart(String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi":kullanici_adi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    return parseFoods(cevap.data.toString());
  }

  Future<void> deleteCart(int food_id, String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {
      "sepet_yemek_id":food_id,
      "kullanici_adi":kullanici_adi,
    };
    await Dio().post(url,data: FormData.fromMap(veri));
  }

}