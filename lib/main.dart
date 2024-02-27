
import 'package:collegelistapi/controller/college_provider.dart';
import 'package:collegelistapi/screen/HomePage.dart';
import 'package:collegelistapi/screen/single_college_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(MultiProvider(
     providers: [
        ChangeNotifierProvider(create: (_) => CollegeProvider()),
      ],
    child: const MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,)));
}

