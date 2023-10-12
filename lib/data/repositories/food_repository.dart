import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_ordering_application/data/models/foods.dart';
import 'package:food_ordering_application/data/models/foods_response.dart';

class FoodRepository
{
    List<Foods> parseFoods(String response)
    {
      return FoodsResponse.fromJosn(json.decode(response)).foods;
    }
    
    Future<List<Foods>> loadFoods() async
    {
      var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
      var response = await Dio().get(url);
      return parseFoods(response.data.toString());
    }

    Future<void> addFoodToCart(String yemek_adi,String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
      var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
      var veri = {
        "yemek_adi":yemek_adi,
        "yemek_resim_adi":yemek_resim_adi,
        "yemek_fiyat" : yemek_fiyat,
        "yemek_siparis_adet": yemek_siparis_adet,
        "kullanici_adi":kullanici_adi
      };
      await Dio().post(url,data: FormData.fromMap(veri));
    }
}