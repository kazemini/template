import 'package:flutter/material.dart';
import 'package:template/config/theme/theme_cubit.dart';

class SecondPage extends StatelessWidget {
  final Map<String,dynamic> data;
   const SecondPage({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page 2'),
      ),
      body:  Center(child: Text(data['txt1']+data['txt2'])),
    );
  }

}
