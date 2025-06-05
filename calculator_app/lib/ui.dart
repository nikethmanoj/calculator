import 'package:flutter/material.dart';

class Ui extends StatelessWidget {
  const Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      backgroundColor: const Color.fromARGB(255, 149, 9, 213), 
      appBar: AppBar(
        title: Text('Your Profile'),
        backgroundColor: const Color.fromARGB(255, 149, 9, 213),
        foregroundColor: const Color.fromARGB(255, 250, 249, 248),
        actions: [Icon(Icons.settings),
        Padding(padding: EdgeInsetsGeometry.only(right: 25))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message_outlined),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 244, 244),
          borderRadius: BorderRadius.only(  
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_LtkphjIaSQ0flVUtvCIGuyBDGIe1ty9QMA&s'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Niketh Manoj',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "UI/UX Designer",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
     ),
   );
  }
}