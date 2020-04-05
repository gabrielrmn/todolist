import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ToDoListHomePage extends StatefulWidget {
  @override
  _ToDoListHomePageState createState() => _ToDoListHomePageState();
}

class _ToDoListHomePageState extends State<ToDoListHomePage> {
  var now = new DateTime.now();
  List<String> tarefas = new List();

  //aqui estamos indicando o estado inicial de nosso widget
  @override
  void initState() {
    super.initState();

    tarefas.add("adsaf");
    tarefas.add("adafssaf");
    tarefas.add("adsaasff");
    tarefas.add("adasfsaf");
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
              Color.fromRGBO(102, 0, 102, 1),
              Color.fromRGBO(102, 0, 102, 0.6),
              Color.fromRGBO(102, 0, 102, 0.4),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, right: 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateFormat('EEEE, d MMM, yyyy').format(now),
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "You have 10 tasks to complete",
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(),
              height: 100,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.deepPurple),
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
    );
  }

  Widget _cardTarefa(BuildContext context, int index) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        child: Wrap(
          children: <Widget>[],
        ),
      ),
    );
  }
}
