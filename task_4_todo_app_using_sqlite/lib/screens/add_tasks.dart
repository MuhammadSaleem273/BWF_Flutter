import 'package:flutter/material.dart';
import 'package:task_4_todo_app_using_sqlite/constants/color.dart';
import 'package:task_4_todo_app_using_sqlite/constants/db_handler.dart';
import 'package:task_4_todo_app_using_sqlite/model/todo_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, 'data');
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            titleFocusNode.unfocus();
            descFocusNode.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container Add task
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.246,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [tdYellow, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(150),
                        bottomLeft: Radius.circular(150)),
                  ),
                  child: const Center(
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                // TextField Container
                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        // title TextField
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 10,
                                    color: tdYellow)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            focusNode: titleFocusNode,
                            controller: titleController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                border: InputBorder.none,
                                hintText: 'Title',
                                hintStyle: TextStyle(color: tdYellow),
                                prefixIcon: Icon(
                                  size: 20,
                                  Icons.title,
                                  color: tdYellow,
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                    maxHeight: 30, minWidth: 25)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //description TextField
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 10,
                                    color: tdYellow)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            focusNode: descFocusNode,
                            controller: descController,
                            maxLines: 2,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: InputBorder.none,
                              hintText: 'Description',
                              hintStyle: TextStyle(color: tdYellow, height: 2),
                              prefixIcon: Icon(
                                size: 20,
                                Icons.description,
                                color: tdYellow,
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                  maxHeight: 30, minWidth: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // Add Button
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 2,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shadowColor: textColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // if there is text => true
                                //if there is empty => false
                                await DBHandler()
                                    .insert(TodoModel(
                                  title: titleController.text.toString(),
                                  description: descController.text.toString(),
                                ))
                                    .then((value) {
                                  print('data is inserted');
                                });
                                Navigator.pop(context);
                              } else {
                                print('no any text');
                              }

                              var data = await DBHandler().read();
                              print(data.map((e) => print(e.toMap())));
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    ),
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
