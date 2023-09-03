import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/models/my_chart_data.dart';

class AdminHomeController extends GetxController {
  List<MyChartData> data = [
    MyChartData(
      id: 0,
      name: "Jan",
      y: 70,
      color: Colors.red,
    ),
    MyChartData(
      id: 1,
      name: "feb",
      y: 15,
      color: Colors.red,
    ),
    MyChartData(
      id: 2,
      name: "mar",
      y: 50,
      color: Color.fromARGB(255, 47, 11, 11),
    ),
    MyChartData(
      id: 3,
      name: "apr",
      y: 80,
      color: Colors.red,
    ),
    MyChartData(
      id: 4,
      name: "may",
      y: 4,
      color: Colors.red,
    ),
    MyChartData(
      id: 5,
      name: "jun",
      y: 70,
      color: Colors.red,
    ),
    MyChartData(
      id: 6,
      name: "jul",
      y: 90,
      color: Colors.red,
    ),
    MyChartData(
      id: 7,
      name: "aug",
      y: 16,
      color: Colors.red,
    ),
    MyChartData(
      id: 8,
      name: "sep",
      y: 69,
      color: Colors.red,
    ),
    MyChartData(
      id: 9,
      name: "oct",
      y: 54,
      color: Colors.red,
    ),
    MyChartData(
      id: 10,
      name: "nov",
      y: 10,
      color: Colors.red,
    ),
    MyChartData(
      id: 11,
      name: "dec",
      y: 70,
      color: Colors.red,
    ),
  ];
}
