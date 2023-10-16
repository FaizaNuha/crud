import 'package:crud/task.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController titController = TextEditingController();
  final TextEditingController disController = TextEditingController();


  List<Task> tasklist = [];

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: titController,
                decoration: InputDecoration(
                    hintText: "Add Title",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter a value";
                  }
                  return null;
                },

              ),
            ),
            SizedBox(
              height: 2,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: disController,
                decoration: InputDecoration(
                    hintText: "Add description",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter a value";
                  }
                  return null;
                },

              ),

            ),
            SizedBox(
              height: 2,
            ),

            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    final titl = titController.text;
                    final des = disController.text;
                    if (titl.isNotEmpty && des.isNotEmpty) {
                      setState(() {
                        tasklist.add(Task(descrip: des, title: titl));
                        titController.clear();
                        disController.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  child: Text("Add"),
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.separated(
                  itemCount: tasklist.length,
                  itemBuilder: (context, index) {
                    return ListTile(

                      title: Text(tasklist[index].title),

                      subtitle: Text(tasklist[index].descrip),
                      leading: CircleAvatar(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent
                            ),
                          )
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                      ),

                      onLongPress: () {
                        _showAlertDialog(context, tasklist[index], index);

                      },

                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 2,
                    );
                  }),
            )
          ],
        ));
  }

  void _showAlertDialog (BuildContext context, Task task, int index){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 60,
          child: AlertDialog(
            title: Text('Alert'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showBottomModalSheet(context, task, index);
                    },
                    child: Text('Edit',style: TextStyle(
                        fontWeight: FontWeight.normal
                    ),),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        tasklist.removeAt(index);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Delete',style: TextStyle(
                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  void _showBottomModalSheet(BuildContext context, Task ttask, int index) {
      String newtit= ttask.title;
      String newdes= ttask.descrip;

      showModalBottomSheet(

          context: context,
          isScrollControlled: true,
          builder: (context){
            return SingleChildScrollView(
              child: Container(
                height: 400,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: ListView(children: [
                   SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(text: ttask.title ),
                      onChanged: (text) {
                        newtit = text;
                      },
                      decoration: const InputDecoration(
                          hintText: "Add New Title",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter a value";
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(text: ttask.descrip),
                      onChanged: (text) {
                        newdes = text;
                      },
                      decoration: const InputDecoration(
                          hintText: "Add New description",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter a value";
                        }
                        return null;
                      },

                    ),

                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: () {

                            setState(() {
                               tasklist[index].title= newtit;
                               tasklist[index].descrip =newdes;
                            });
                            Navigator.of(context).pop();
                          }
                        ,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),

                        child: Text("EDIT", style: TextStyle(
                          fontWeight: FontWeight.w100
                        ),),
                      ),
                    ),
                  ),
                ],),
              ),
            );
          });
  }
}



