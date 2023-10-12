import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_application/ui/Cubit/food_cubit.dart';
import 'package:food_ordering_application/ui/Cubit/foodslist_cubit.dart';
import 'package:food_ordering_application/ui/Cubit/shoppingcart_cubit.dart';
import 'package:food_ordering_application/ui/Cubit/shoppingcartlist_cubit.dart';
import 'package:food_ordering_application/ui/Screen/navigation_bar.dart';
import 'package:food_ordering_application/ui/utils/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodsListCubit()),
        BlocProvider(create: (context) => ShoppingCartListCubit()),
        BlocProvider(create: (context) => FoodCubit()),
        BlocProvider(create: (context) => ShoppingCartCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.backColor),
          useMaterial3: true,
        ),
        home: const HomeBottomNavigationBar(),
      ),
    );
  }
}