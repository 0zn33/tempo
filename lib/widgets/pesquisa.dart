import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';


var cCity;




class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}


class _MyCustomFormState extends State<MyCustomForm> {
  
  final myController = TextEditingController();

  @override
  void dispose() {
    
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
         TextField(
          controller: myController,
          decoration: InputDecoration(
              hintText: 'Encontre uma cidade',
              border: OutlineInputBorder(),
              prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    
                    cCity = myController.text;
                  });
                pesquisa();
                setState(() {});
                }, 
                icon: Icon(Icons.search),
              )
        ),
      ),
      );
    
  }
      
              

}



