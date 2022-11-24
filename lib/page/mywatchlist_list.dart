import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:diah/model/mywatchlist.dart';
import 'package:diah/page/drawer.dart';
import 'package:diah/page/mywatchlistdetail.dart';
import 'package:flutter/material.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPage();
}

class _MyWatchListPage extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchToDo() async {
    var url =
        Uri.parse('https://tugas2-pbp-diyah.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<MyWatchList> dataWatchList = [];
    for (var d in data) {
      if (d != null) {
        dataWatchList.add(MyWatchList.fromJson(d));
      }
    }
    return dataWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watch List"),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
          future: fetchToDo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "watchlist belum ada:(",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 7),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 2.0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "${snapshot.data![index].title}",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailWatchListPage(
                                        thisWatchList: snapshot.data[index],
                                      )),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}
