import 'package:flutter/material.dart';
import 'food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Food Lists";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            title: const Text(appTitle),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            padding: const EdgeInsets.all(4),
            childAspectRatio: 1.4,
            children: foods
                .map((food) => FoodItem(
              food: food,
            ))
                .toList(),
          )),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightBlue,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetailPage(food: food)));
          },
          child: Column(
            children: [
              Image.asset(
                food.image,
                width: 200,
                height: 100,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  food.name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}


class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        title: const Text("Detail Food"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                food.image,
                width: 600,
                height: 250,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10.0),
              Text(food.name,style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  food.desc,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


