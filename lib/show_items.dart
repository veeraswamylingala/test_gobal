import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  final List<String> selctedItems;
  const Items({Key? key, required this.selctedItems}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Selected Items"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: widget.selctedItems.isEmpty
              ? Center(child: Text("No Items Selected"))
              : ListView.builder(
                  itemCount: widget.selctedItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child:
                            ListTile(title: Text(widget.selctedItems[index])));
                  }),
        ));
  }
}
