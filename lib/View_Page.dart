import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'List.dart';

class View_Page extends StatefulWidget {
  const View_Page({super.key});

  @override
  State<View_Page> createState() => _View_PageState();
}

class _View_PageState extends State<View_Page> {
  getRandomColor() {
    Random random = Random();
    return backgroungColor[random.nextInt(backgroungColor.length)];
  }
  // String? Title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }
 void getdetails()
 {
   dataList = sharepref!.getStringList("dataList") ?? [] ;
   // Title = sharepref!.getString("title");
   print("Title : $Title");
   setState(() {});
 }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Search Notes...",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade800,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.only(top: 30),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {
                  t1.text = dataList[index];
                  Navigator.popAndPushNamed(context, 'second',arguments: index);
                },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 20),
                    color: getRandomColor(),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text:   TextSpan(
                         text: "${dataList[index]}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 1),
                        child: Text(
                          "Edited : ${DateFormat('EEE MMM d, yyyy h:mm a').format(DateTime.now())}",
                          style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          dataList.removeAt(index);
                          await sharepref!.setStringList("dataList", dataList);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            t1.text = "";
            Navigator.pushNamed(context, 'second');
          },
          backgroundColor: Colors.grey.shade800,
          elevation: 10,
          child: const Icon(
            Icons.add,
            size: 38,
          )),
    );
  }
}
