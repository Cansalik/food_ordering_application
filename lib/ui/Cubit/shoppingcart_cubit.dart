import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/data/repositories/shopping_cart_repository.dart';

class ShoppingCartCubit extends Cubit<void>
{
  ShoppingCartCubit() : super(0);

  ShoppingCartRepository shoppingCartRepository = ShoppingCartRepository();

  Future<void> deleteCart(int food_id, String kullanici_adi) async {
    shoppingCartRepository.deleteCart(food_id, kullanici_adi);
  }

}