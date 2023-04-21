import 'package:flutter/material.dart';
import 'package:location_based_reminder/db/functions/db_functions.dart';
import 'package:location_based_reminder/db/models/db_models.dart';


class NotifyInput extends StatelessWidget {
   NotifyInput({super.key});
  final _nameField=TextEditingController();
  final _distField=TextEditingController();
  final _locationField=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Notification',
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
              controller:_nameField ,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                
                hintText: 'Enter Reciepient Name',
                labelText: 'Reciepient Name',
                
                border: OutlineInputBorder(),
              ),
                      
                      ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: TextFormField(
              controller:_distField ,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                
                
                hintText: 'Before ',
                labelText: 'Before',
                border: OutlineInputBorder(),
              ),
            
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: TextFormField(
              controller:_locationField ,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                
                
                hintText: 'Choose Location ',
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            
            ),
          ),

          ElevatedButton(onPressed: (){
            onAddNotify();
            Navigator.of(context).pushNamed('notify_home');
            // onAddTask();
            // Navigator.of(context).pushNamed('reminder_home');
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
  Future<void>onAddNotify() async{
    final _namedata=_nameField.text.trim();
    final _locationdata=_locationField.text.trim();
    final _distdata=_distField.text.trim();
    if(_namedata.isEmpty || _locationdata.isEmpty||_distdata.isEmpty){
      return;
    }

    print('$_namedata $_locationdata $_distField');
    final _notifydb=NotifyModel(name: _namedata, distance: _distdata, location: _locationdata);
    addNotify(_notifydb);
     //final _taskdb=TaskModel(task: _taskdata, location: _locationdata);
    //addTask(_taskdb);

  //  final _student =StudentModel(name: _task, age: _location);
  //   addStudent(_student);
  }
}