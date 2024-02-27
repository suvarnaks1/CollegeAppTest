import 'package:collegelistapi/controller/college_provider.dart';
import 'package:collegelistapi/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'single_college_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.transparent,
         automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          "Colleges List",
          style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
        )),
      ),
      // backgroundColor: scaffoldColor,

      //listViewbuilder
      body: FutureBuilder(
          future: context.read<CollegeProvider>().collegeData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var collegeName = snapshot.data![index].name;
                  var country = snapshot.data![index].country;
                  var url = snapshot.data![index].webPages;
                  var countryCode = snapshot.data![index].alphaTwoCode;
                  var province = snapshot.data![index].stateProvince ?? "";
                  var domain = snapshot.data![index].domains;
                  return _buildCard(collegeName, country, url[0], context,
                      index, countryCode, province, domain[0]);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

//buildcard
  Widget _buildCard(
      String collegeName,
      String country,
      url,
      BuildContext context,
      int index,
      String countryCode,
      String province,
      String domain) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
             [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(5, 5),
                blurRadius: 10)
          ]),
      child: Card(
       
        // Add  card
        child: ListTile(
          
          //image
          leading: CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(
              'assets/student.png',
            ),
            backgroundColor: Colors.white,
          ),

          title: Text(
            'College Name :${collegeName}',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          // subtitle: Text('Country Name :${country}'),

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CollegeDetails(
                        index: index,
                        webPage: url,
                        collegeName: collegeName,
                        coutryName: country,
                        coutryCode: countryCode,
                        domain: domain,
                        province: province,
                      )),
            );
          },
        ),
      ),
    );
  }
}
