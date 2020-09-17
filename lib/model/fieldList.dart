import 'file:///C:/Users/91856/AndroidStudioProjects/boongg/lib/model/field.dart';
import 'package:flutter/material.dart';
import '../db_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class _FieldListState extends State<FieldList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getField().then(
          (foodList) {
        BlocProvider.of<FieldBloc>(context).add(SetFoods(foodList));
      },
    );
  }

  showFoodDialog(BuildContext context, Food food, int index) {
    showDialog(
        context: context,
        @@ -30,7 +43,12 @@ class _FoodListState extends State<FoodList> {
    child: Text("Update"),
    ),
    FlatButton(
    onPressed: () => {},
    onPressed: () => DatabaseProvider.db.delete(food.id).then((_) {
    BlocProvider.of<FoodBloc>(context).add(
    DeleteFood(index),
    );
    Navigator.pop(context);
    }),
    child: Text("Delete"),
    ),
    FlatButton(
    onPressed: () => Navigator.pop(context),
    child: Text("Cancel"),
    ),
    ],
    ),
    );
    }
        @override
        Widget build(BuildContext context) {
      print("Building entire food list scaffold");
      return Scaffold(
        appBar: AppBar(title: Text("FoodList")),
        body: Container(
          child: BlocConsumer<FieldBloc, List<Food>>(
            builder: (context, foodList) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  print("foodList: $foodList");
                  Food food = foodList[index];
                  return ListTile(
                      title: Text(food.name, style: TextStyle(fontSize: 30)),
                      subtitle: Text(
                        "Calories: ${food.calories}\nVegan: ${food.isVegan}",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () => showFoodDialog(context, food, index));
                },
                itemCount: foodList.length,
                separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black),
              );
            },
            listener: (BuildContext context, foodList) {},
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => FoodForm()),
          ),
        ),
      );
    }
  }
