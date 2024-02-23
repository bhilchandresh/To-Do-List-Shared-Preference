import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'List.dart';

class Add_Page extends StatefulWidget {
  const Add_Page({super.key});

  @override
  State<Add_Page> createState() => _Add_PageState();
}
class _Add_PageState extends State<Add_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade800.withOpacity(.8),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new)),
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: t1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        onPressed: () async {
          dataList = sharepref!.getStringList("dataList") ?? [];
          // await sharepref!.setString("title", t1.text);
          dataList.add(t1.text);
          
          await sharepref!.setStringList("dataList", dataList);

          Navigator.popAndPushNamed(context, 'first',);
        },
        child: Icon(Icons.save_sharp),
      ),
    );
  }
}
