import 'package:covid_19_app/api_services/api_client.dart';
import 'package:covid_19_app/views/widgets/reusable_row.dart';
import 'package:flutter/material.dart';

import 'country_list_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ApiClient _apiclient = ApiClient();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 17, 17),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 200,
                width: 500,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(85)),
                child: Image(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSNWQqv7Dhbhd2PIHs8pXYWEpTTsYHl3EtBA&s",
                      scale: 1.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 480,
                  child: FutureBuilder(
                      future: _apiclient.worldWildData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "Data Is Not Available",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return Card(
                            color: const Color.fromARGB(255, 51, 49, 49),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ReausableRow(
                                      title: "Total",
                                      value: snapshot.data!.cases.toString()),
                                  ReausableRow(
                                      title: "Deaths",
                                      value: snapshot.data!.deaths.toString()),
                                  ReausableRow(
                                      title: "Recovered",
                                      value:
                                          snapshot.data!.recovered.toString()),
                                  ReausableRow(
                                      title: "Active",
                                      value: snapshot.data!.active.toString()),
                                  ReausableRow(
                                      title: "Criticle",
                                      value:
                                          snapshot.data!.critical.toString()),
                                  ReausableRow(
                                      title: "Today Deaths",
                                      value: snapshot.data!.todayDeaths
                                          .toString()),
                                  ReausableRow(
                                      title: "Today Recovered",
                                      value: snapshot.data!.todayRecovered
                                          .toString()),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          );
                        }
                      })),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 84, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 67,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CountryListScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Trac Countries"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
