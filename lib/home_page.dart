// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  resettozero({bool reset = false}) {
    setcount(_counter = 0);
    settime(_time = 0);
    reset == true ? setgoal(_gool = 1) : null;
  }

  setcount(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    getcount();
    prefs.setInt("counter", value);
  }

  settime(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    getcount();
    prefs.setInt("time", value);
  }

  setgoal(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    getcount();
    prefs.setInt("goal", value);
  }

  getcount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
      _time = prefs.getInt('time') ?? 0;
      _gool = prefs.getInt('goal') ?? 0;
    });
  }

  void initState() {
    getcount();
    super.initState();
  }

  bool isActive = true;
  int rad = 0;
  Color maincolor = Color(0xffB1001c);
  int _counter = 0;
  int _time = 0;
  int _gool = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          splashColor: maincolor,
          backgroundColor: maincolor.withOpacity(.5),
          onPressed: () {
            resettozero(reset: true);
          },
          child: Icon(
            Icons.refresh,
            size: 35,
            weight: 60,
            color: maincolor,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sub7an_Allah",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: maincolor,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                child: Icon(
                  isActive ? Icons.color_lens : Icons.color_lens_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: maincolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "الهدف",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            resettozero();
                            setgoal(_gool - 1);
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                            size: 30,
                          )),
                      Text(
                        "$_gool",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            resettozero();
                            setgoal(_gool + 1);
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 30,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          resettozero();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "0",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setgoal(_gool = 33);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "33",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setgoal(_gool = 100);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "100",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setgoal(_gool += 100);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "+100",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setgoal(_gool += 1000);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "+1000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Text(
                    "ألاستغفار  ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: maincolor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "$_counter",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: maincolor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 20,
                    radius: 80.0,
                    lineWidth: 5.0,
                    percent: _counter / _gool,
                    center: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_counter >= _gool) {
                            settime(_time + 1);
                            setcount(_counter = 1);
                          } else {
                            setcount(_counter + 1);
                          }
                        });
                      },
                      child: new Icon(
                        Icons.touch_app,
                        size: 50.0,
                        color: maincolor,
                      ),
                    ),
                    backgroundColor: maincolor.withOpacity(0.2),
                    progressColor: maincolor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("مرات التكرار : $_time",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: maincolor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("المجموع : ${_time * _gool + _counter} ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: maincolor)),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Visibility(
              visible: isActive,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Radio(
                        value: 0,
                        groupValue: rad,
                        activeColor: maincolor,
                        onChanged: (val) {
                          setState(() {
                            maincolor = Colors.black;
                            rad = val!;
                          });
                        }),
                    Radio(
                        value: 1,
                        activeColor: maincolor,
                        groupValue: rad,
                        onChanged: (val) {
                          setState(() {
                            maincolor = Colors.amberAccent;
                            rad = val!;
                          });
                        }),
                    Radio(
                        activeColor: maincolor,
                        value: 2,
                        groupValue: rad,
                        onChanged: (val) {
                          setState(() {
                            maincolor = Color(0xffB1001c);
                            rad = val!;
                          });
                        }),
                    Radio(
                        activeColor: maincolor,
                        value: 3,
                        groupValue: rad,
                        onChanged: (val) {
                          setState(() {
                            maincolor = Colors.indigo.shade700;
                            rad = val!;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
