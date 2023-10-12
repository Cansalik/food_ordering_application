import 'package:flutter/material.dart';
import 'package:food_ordering_application/ui/widgets/home_page/clip_path.dart';
import 'package:food_ordering_application/ui/widgets/home_page/products_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return  const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomClip(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Teslimat Adresi",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                      Text("Ev",style: TextStyle(color: Colors.black, fontSize: 14),),
                    ],
                  ),
                  Icon(Icons.home_outlined,size: 64,color: Colors.black,)
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ara',
                    prefixIcon:  Icon(Icons.search),
                    border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              ProductsList(),
            ],
          ),
        ),
      ),
    );
  }
}
