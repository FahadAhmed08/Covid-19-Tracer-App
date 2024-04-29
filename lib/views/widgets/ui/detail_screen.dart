import 'package:covid_19_app/views/widgets/reusable_row.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 17, 17),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 67, 67),
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Card(
                  color: Color.fromARGB(255, 51, 49, 49),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      ReausableRow(
                        title: "Cases",
                        value: widget.totalCases.toString(),
                      ),
                      ReausableRow(
                        title: "Recovered",
                        value: widget.totalRecovered.toString(),
                      ),
                      ReausableRow(
                        title: "Death",
                        value: widget.totalDeaths.toString(),
                      ),
                      ReausableRow(
                        title: "Critical",
                        value: widget.critical.toString(),
                      ),
                      ReausableRow(
                        title: "Today Recovered",
                        value: widget.todayRecovered.toString(),
                      )
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
