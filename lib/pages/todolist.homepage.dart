import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todolist/structure/task.dart';

class ToDoListHomePage extends StatefulWidget {
  @override
  _ToDoListHomePageState createState() => _ToDoListHomePageState();
}

class _ToDoListHomePageState extends State<ToDoListHomePage> {
  var now = new DateTime.now();
  List<Task> tarefas = new List();

  //aqui estamos indicando o estado inicial de nosso widget
  @override
  void initState() {
    super.initState();

    tarefas.add(new Task(
        "Shopping", "Need to buy some clothes in Shopping Mall", false));
    tarefas.add(
        new Task("Supermarket", "Need to buy some food for quarentine", true));
    tarefas.add(new Task("Gym", "Need to cancel my gym pass", false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [
              0.3,
              0.45,
              1,
            ],
            colors: [
              Color.fromRGBO(0, 0, 51, 1),
              Color.fromRGBO(0, 0, 128, 1),
              Color.fromRGBO(0, 0, 128, 0.4),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateFormat('EEEE').format(now),
                    style: GoogleFonts.roboto(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.white,
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
                        color: Colors.white.withOpacity(0.6),
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
                        color: Colors.white.withOpacity(0.7),
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
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 320,
                    width: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
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
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.deepPurple),
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
    );
  }

  Widget _cardTarefa(BuildContext context, int index) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        color: tarefas[index].completed
            ? Colors.white
            : Colors.white.withOpacity(0.4),
        child: Wrap(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 0.0),
                  child: Text(
                    tarefas[index].name,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      textStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 51, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text(
                    tarefas[index].description,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      textStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 51, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
