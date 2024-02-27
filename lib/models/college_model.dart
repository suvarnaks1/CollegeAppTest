// To parse this JSON data, do
//
//     final collegeModel = collegeModelFromJson(jsonString);

import 'dart:convert';

List<CollegeModel> collegeModelFromJson(String str) => List<CollegeModel>.from(json.decode(str).map((x) => CollegeModel.fromJson(x)));

String collegeModelToJson(List<CollegeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollegeModel {
    String alphaTwoCode;
    dynamic stateProvince;
    String country;
    String name;
    List<String> webPages;
    List<String> domains;

    CollegeModel({
        required this.alphaTwoCode,
        required this.stateProvince,
        required this.country,
        required this.name,
        required this.webPages,
        required this.domains,
    });

    factory CollegeModel.fromJson(Map<String, dynamic> json) => CollegeModel(
        alphaTwoCode: json["alpha_two_code"],
        stateProvince: json["state-province"],
        country: json["country"],
        name: json["name"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        domains: List<String>.from(json["domains"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCode,
        "state-province": stateProvince,
        "country": country,
        "name": name,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "domains": List<dynamic>.from(domains.map((x) => x)),
    };
}
