import 'package:crud/task.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Task> tasks =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            style: IconButton.styleFrom(minimumSize: Size(40, 40)),
          )
        ],
      ),

      body: ListView(
        shrinkWrap: true,
        children: [
           TextField(
             decoration: InputDecoration(
               hintText: "Add Title",
               border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(2)
                   )
               )
             ),
           ),
          SizedBox(height: 4,),

          TextField(
            decoration: InputDecoration(
              hintText: "Add description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)
                    )
                )
            ),
          ),
          SizedBox(height: 4,),

          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: (){},
              child: Text("Addd"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),

            ),
          ),

          ListView.separated(
              itemCount: tasks.length,
              itemBuilder: (context,index) =>  getRow(index),
            separatorBuilder: (BuildContext context, int index){
                return const Divider(height: 4,);
            }
          )

        ],
      )

    );
  }

  Widget getRow(int index ) {
    return ListTile(
      title: Text(tasks[index].title),
      subtitle: Text(tasks[index].descrip),
      leading: CircleAvatar(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.redAccent
            ),
          )
      ),
      trailing: IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_forward),
      ),
    );

  }
}



