import 'package:diah/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:diah/page/form.dart';
import 'package:diah/main.dart';
import 'package:diah/model/budget.dart';

class DataBudget extends StatefulWidget {
  var myBudget;
  DataBudget({super.key, this.myBudget});

  @override
  State<DataBudget> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<DataBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data Budget"),
        ),
        drawer: MyDrawer(
          theBudget: widget.myBudget,
        ),
        body: Column(children: [
          if (widget.myBudget == null)
            const Center(
              child: Text("Data Kosong"),
            )
          else if (widget.myBudget.length == 0)
            const Center(
              child: Text("Data Kosong"),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: widget.myBudget.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(widget.myBudget[index].judul),
                        subtitle: Text(widget.myBudget[index].nominal),
                        trailing: Column(
                          children: [
                            Text(widget.myBudget[index].jenis),
                            Text(widget.myBudget[index].date.toString()),
                          ],
                        )),
                  );
                },
              ),
            ),
        ]));
  }
}
