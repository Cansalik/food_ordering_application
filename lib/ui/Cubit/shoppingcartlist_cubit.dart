import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/data/models/shopping_cart_foods.dart';
import 'package:food_ordering_application/data/repositories/shopping_cart_repository.dart';

class ShoppingCartListCubit extends Cubit<List<ShoppingCartFoods>>
{
  ShoppingCartListCubit():super(<ShoppingCartFoods>[]);

  ShoppingCartRepository shoppingCartRepository = ShoppingCartRepository();

  Future<void> loadShoppingCart(String kullanici_adi) async {
    var list = await shoppingCartRepository.loadShoppingCart(kullanici_adi);
    emit(list);
  }
}