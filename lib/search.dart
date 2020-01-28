import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  final cities=[
    "Agra",
    "Ahmedabad",
    "Allahabad",
    "Amaravati",
    "Bangalore",
    "Bareilly",
    "Bhubaneswar",
    "Chandigarh",
    "Chennai",
    "Cuttack"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query="";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              query
            ),
          ),

        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggetions =query.isEmpty?[]:cities.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context,index) =>ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text:suggetions[index].substring(0,query.length),
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            children: [TextSpan(
              text: suggetions[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
            )]
          ),
        )
          // suggetions[index]),
      ),
      itemCount: suggetions.length,
    );
  }
}
