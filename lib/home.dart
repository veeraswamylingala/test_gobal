import 'package:flutter/material.dart';
import 'package:theoneglobaltask/show_items.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tempList = [];
  List<String> tabItems = [
    "Light",
    "Light1",
    "Light2",
    "RGB",
    "Light4",
    "Light5"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Test"),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text('Hall'),
                  ),
                  Tab(
                    child: Text('Dinning'),
                  ),
                  Tab(
                    child: Text('Bathroom'),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                gridView(),
                gridView(),
                gridView(),
              ],
            )),
      ),
    );
  }

  Widget gridView() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(tabItems.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (tempList.contains(tabItems[index])) {
                            tempList.remove(tabItems[index]);
                          } else {
                            tempList.add(tabItems[index]);
                          }
                        });
                      },
                      child: Container(
                          color: tempList.contains(tabItems[index])
                              ? Colors.red
                              : Colors.green,
                          child: Center(child: Text(tabItems[index]))),
                    );
                  })),
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.red,
              onPressed: () {
                setState(() {
                  tempList = tempList.toSet().toList();
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Items(
                              selctedItems: tempList,
                            )));
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
