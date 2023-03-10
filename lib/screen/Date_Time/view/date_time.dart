import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homeprovider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  home_provider? providerT;
  home_provider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<home_provider>(context, listen: true);
    providerF = Provider.of<home_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Icon(Icons.timer_outlined),
          title: Text("    Date & Time App"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "         Date = ${providerT!.currentDate.day}/${providerT!.currentDate.month}/${providerT!.currentDate.year}",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Time = ${providerT!.currentTime.hour}:${providerT!.currentTime.minute}",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: providerF!.currentDate,
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2050));
                    providerF!.ChangeDate(date!);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Date',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    TimeOfDay? time = await showTimePicker(
                        context: context, initialTime: providerF!.currentTime);

                    providerF!.ChangeTime(time);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Time',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
