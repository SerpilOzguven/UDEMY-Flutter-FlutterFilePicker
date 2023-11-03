

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? file;
  var files = <File>[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Picker'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () async {
             FilePickerResult? result = await FilePicker.platform.pickFiles(
               allowMultiple: true,
               allowedExtensions: ['png','jpg','pdf'],
               type: FileType.custom,
               onFileLoading: (data){
                print('onFileLoading ${data.name}');
              },
            );

             setState(() {
               files = result!.paths.map((path) => (File(path!))).toList();
             });
          },
              child:const Text('Pick Files')
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 50),
              itemCount: 1 ,
              itemBuilder: (context, index) => Image.file(
              files[index],
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              ),
            ),
          ),
          Image.network(
              'https://www.pexels.com/photo/red-dahlia-flower-60597/',
              fit: BoxFit.cover,
              height: 150,
              width: 150,
          ),
        ],
      ),
    );
  }
}