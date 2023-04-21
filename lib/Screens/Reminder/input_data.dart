import 'package:flutter/material.dart';
import '../../db/functions/db_functions.dart';
import '../../db/models/db_models.dart';

class IpFormField extends StatelessWidget {
  IpFormField({super.key});
  final _task = TextEditingController();
  final _location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Reminder',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child:Padding(
          padding:EdgeInsets.only(top: 40,left: 20,right: 20) ,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15),
              child: TextFormField(
              controller:_task ,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                
                hintText: 'Enter Task',
                labelText: 'Task',
                
                border: OutlineInputBorder(),
              ),
                      
                      ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: TextFormField(
              controller:_location ,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                
                
                hintText: 'Choose Location',
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            
            ),
          ),
          ElevatedButton(onPressed: (){
            
            onAddTask();
            Navigator.of(context).pushNamed('reminder_home');
            //onAddTask();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent, // Background color
          ),
           child: Text('Submit',style: TextStyle(fontSize: 19),))
          ]),
          )
        ),
    );
  }
  Future<void>onAddTask() async{
    final _taskdata=_task.text.trim();
    final _locationdata=_location.text.trim();
    if(_taskdata.isEmpty || _locationdata.isEmpty){
      return;
    }

    print('$_taskdata $_locationdata');
     final _taskdb=TaskModel(task: _taskdata, location: _locationdata);
    addTask(_taskdb);

  //  final _student =StudentModel(name: _task, age: _location);
  //   addStudent(_student);
  }
}
