import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todolist/structure/task.dart';
import 'package:todolist/pages/todolist.createcard.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ToDoListHomePage extends StatefulWidget {
  @override
  _ToDoListHomePageState createState() => _ToDoListHomePageState();
}

class _ToDoListHomePageState extends State<ToDoListHomePage> {
  var now = new DateTime.now();
  List<Task> tarefas = new List();
  List<String> priority = ["Low", "Normal", "High", "Urgent"];
  //aqui estamos indicando o estado inicial de nosso widget
  @override
  void initState() {
    super.initState();

    tarefas.add(new Task("Shopping", false, priority[0], "asfasfsaf"));
    tarefas.add(new Task("Supermarket", true, priority[1], "asfasasffsaf"));
    tarefas.add(new Task("Gym", false, priority[2], "asfasfsasfasfasfasfaf"));
    tarefas
        .add(new Task("Work", false, priority[3], "asfasfasfasfasfsafasfsaf"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.05)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateFormat('EEEE').format(now),
                    style: GoogleFonts.roboto(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateFormat('d MMM, yyyy').format(now),
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You have ${tarefas.length} tasks to complete",
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Your tasks:",
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 400,
                    width: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) {
                        return _cardTarefa(context, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateCard()));
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
    );
  }

  Widget _cardTarefa(BuildContext context, int index) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        color: tarefas[index].completed
            ? Colors.white.withOpacity(0.4)
            : Colors.white,
        child: Wrap(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.black,
                  value: tarefas[index].completed,
                  onChanged: (bool value) {
                    setState(() {
                      tarefas[index].completed = value;
                    });
                  },
                ),
                Container(
                  width: 180,
                  child: AutoSizeText(
                    tarefas[index].name,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      textStyle: tarefas[index].completed
                          ? TextStyle(
                              color: Color.fromRGBO(0, 0, 51, 0.7),
                              decoration: TextDecoration.lineThrough,
                            )
                          : TextStyle(
                              color: Color.fromRGBO(0, 0, 51, 1),
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _selectColor(tarefas[index].priority)),
                    child: Center(
                      child: Text(
                        tarefas[index].priority,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          textStyle: tarefas[index].completed
                              ? TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  decoration: TextDecoration.lineThrough,
                                )
                              : TextStyle(
                                  color: Colors.white,
                                ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    _showMoreHoriz(index);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditCard(int index) {}

  void _showMoreHoriz(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 160, left: 20, right: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: Colors.transparent,
          content: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 180,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.zoom_in),
                        ),
                        Text("Visualize Task"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        ),
                        Text("Edit Task"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              tarefas.removeAt(index);
                              Navigator.pop(context);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                        Text("Delete Task"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                        child: Text(
                          'FECHAR',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _selectColor(String priority) {
    switch (priority) {
      case "Low":
        return Colors.lightBlue;
      case "Normal":
        return Colors.green;
      case "High":
        return Colors.orange;
      case "Urgent":
        return Colors.red;
    }
  }
}
