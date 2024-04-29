import 'package:covid_19_app/api_services/api_client.dart';
import 'package:covid_19_app/model/countries_model.dart';
import 'package:covid_19_app/model/worldwild_model.dart';
import 'package:covid_19_app/views/widgets/ui/detail_screen.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  TextEditingController searchController = TextEditingController();
  ApiClient _apiclient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 49, 49),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 51, 49, 49),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Search Country Name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: _apiclient.countriesData(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        "Loading....",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]["country"];
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                  image: snapshot.data![index]
                                                      ["countryInfo"]["flag"],
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  totalCases: snapshot
                                                      .data![index]["cases"],
                                                  totalRecovered:
                                                      snapshot.data![index]
                                                          ["recovered"],
                                                  totalDeaths: snapshot
                                                      .data![index]["deaths"],
                                                  active: snapshot.data![index]
                                                      ["active"],
                                                  test: snapshot.data![index]
                                                      ["tests"],
                                                  todayRecovered:
                                                      snapshot.data![index]
                                                          ["todayRecovered"],
                                                  critical: snapshot
                                                      .data![index]["critical"],
                                                )));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 80,
                                      width: 80,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"]),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country']
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]["cases"].toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                  image: snapshot.data![index]
                                                      ["countryInfo"]["flag"],
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  totalCases: snapshot
                                                      .data![index]["cases"],
                                                  totalRecovered:
                                                      snapshot.data![index]
                                                          ["recovered"],
                                                  totalDeaths: snapshot
                                                      .data![index]["deaths"],
                                                  active: snapshot.data![index]
                                                      ["active"],
                                                  test: snapshot.data![index]
                                                      ["tests"],
                                                  todayRecovered:
                                                      snapshot.data![index]
                                                          ["todayRecovered"],
                                                  critical: snapshot
                                                      .data![index]["critical"],
                                                )));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 80,
                                      width: 80,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"]),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country']
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]["cases"].toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          ),
        ],
      )),
    );
  }
}
