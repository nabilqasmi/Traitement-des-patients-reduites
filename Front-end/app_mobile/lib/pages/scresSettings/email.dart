import 'package:flutter/material.dart';

import 'new_pass.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar=SnackBar(
            content: const Text("Vérifier votre Boite d'email"),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return NewPass();
                  }
              ));
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
          child: Text(
            "Email Confirmé",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
