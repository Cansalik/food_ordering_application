import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/data/models/foods.dart';
import 'package:food_ordering_application/data/repositories/food_repository.dart';

class FoodsListCubit extends Cubit<List<Foods>>
{
  FoodsListCubit():super(<Foods>[]);


  FoodRepository foodRepository = FoodRepository();

  Future<void> loadFoods() async
  {
    var list = await foodRepository.loadFoods();
    emit(list);
  }

}