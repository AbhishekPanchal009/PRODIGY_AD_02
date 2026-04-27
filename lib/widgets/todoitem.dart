import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        onTap: () {
          print('Clicked on To Do Item');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box,
          color: Colors.lightBlueAccent,
        ),
        title: Text('Check Documents',
          style: TextStyle(fontSize: 16,
              color:Colors.black,
            decoration: TextDecoration.lineThrough,

          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child:IconButton(
            padding: EdgeInsets.all(5),
            color: Colors.white,
            icon: Icon(Icons.delete),
            onPressed: (){
              print('pressed on delete icon');
            },
          ),
        ),
      ),
    );
  }
}

