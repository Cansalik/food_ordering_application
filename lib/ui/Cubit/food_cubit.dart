import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/data/repositories/food_repository.dart';

class FoodCubit extends Cubit<void>
{
  FoodCubit() : super(0);

  FoodRepository foodRepository = FoodRepository();

  Future<void> addFoodToCart(String yemek_adi,String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async
  {
    foodRepository.addFoodToCart(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }
}