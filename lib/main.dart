import 'package:flutter/material.dart';
import 'package:task2todolist/model/todo.dart';
import 'widgets/todoitem.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final todolist = ToDo.todolist();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do list',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDo> todolist = ToDo.todolist();

  TextEditingController c = TextEditingController();

  String? id;
  String? todoText;

  void _addTodoItem(String text) {
    if (text.isEmpty) return;

    setState(() {
      todolist.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: text,
        ),
      );
    });

    c.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('To-Do list',style: TextStyle(color: Colors.white),),

        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            searchBox(),
            addBox(),
            Expanded(
              child: ListView(
                children: [
                  for (ToDo todo in todolist)
                  ToDoItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget searchBox(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              prefixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25
              ),
              hintText: 'Search',
              border: InputBorder.none
          ),
        ),
      ),
    );
  }
  Widget addBox(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: c,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                    hintText: 'Add a new task',
                    border: InputBorder.none
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addTodoItem(c.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
