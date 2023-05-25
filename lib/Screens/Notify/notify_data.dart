import 'package:flutter/material.dart';
import 'package:location_based_reminder/Screens/Notify/add_user.dart';
import 'package:location_based_reminder/db/functions/db_functions.dart';
import 'package:location_based_reminder/db/models/db_models.dart';

class NotifyInput extends StatefulWidget {
  NotifyInput({Key? key}) : super(key: key);

  @override
  State<NotifyInput> createState() => _NotifyInputState();
}

class _NotifyInputState extends State<NotifyInput> {
  final _distField = TextEditingController();
  final _locationField = TextEditingController();
  String? selectedName;

  // @override
  // void initState() {
  //   super.initState();
  //   selectedName = 'Self'; // Set default value as 'Self'
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ValueListenableBuilder<List<UserModel>>(
          valueListenable: userListNotifier,
          builder: (BuildContext ctx, List<UserModel> userList, Widget? child) {
            List<String> data = userList.map((user) => user.name).toList();

            List<DropdownMenuItem<String>> dropdownItems = data.map((name) {
              return DropdownMenuItem<String>(
                value: name,
                child: Text(name),
              );
            }).toList();

            return Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: DropdownButtonFormField<String>(
                      value: selectedName,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        labelText: 'Select a name',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedName = value!;
                        });
                      },
                      items: [
                        ...dropdownItems,
                        DropdownMenuItem<String>(
                          value: 'Add New Name',
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (ctx) {
                                      return AddUser();
                                    }),
                                  );
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: TextFormField(
                      controller: _distField,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Before',
                        labelText: 'Before',
                        border: OutlineInputBorder(),
                        suffixText: 'km',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: TextFormField(
                      controller: _locationField,
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
                  ElevatedButton(
                    onPressed: () {
                      onAddNotify();
                      Navigator.of(context).pushNamed('notify_home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: Text(
                      'Submit',
                      style: const TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> onAddNotify() async {
    final _namedata = selectedName;
    final _locationdata = _locationField.text.trim();
    final _distdata = _distField.text.trim();
    if (_locationdata.isEmpty || _distdata.isEmpty) {
      return;
    }

    print('$_namedata $_locationdata $_distField');
    if (selectedName==null){
      final _notifydb = NotifyModel(
      name: 'Self',
      distance: _distdata,
      location: _locationdata,

    );
    addNotify(_notifydb);

    }
    else{
      final _notifydb = NotifyModel(
      name: selectedName!,
      distance: _distdata,
      location: _locationdata,
    );
    addNotify(_notifydb);

    }
    
  }
}
