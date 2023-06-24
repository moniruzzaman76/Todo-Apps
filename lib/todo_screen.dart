import 'package:flutter/material.dart';
import 'package:to_do/todo_model.dart';
import 'package:to_do/widget/custom_button.dart';
import 'package:to_do/widget/custom_textfield.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {

  List<ToDo> todo = [];

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("To-Do"),
        actions: [
          IconButton(
              onPressed: (){
            todo.clear();
            if(mounted){
              setState(() {});
            }
          }, icon: const Icon(Icons.playlist_remove_outlined))
        ],
      ),
      body: ListView.separated(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: (){
              todo[index].isCompleted =! todo[index].isCompleted;
              if(mounted){
                setState(() {});
              }
            },
            title: Text(todo[index].title,style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),),
            subtitle: Text(todo[index].description,style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    updateToDoModelSheet(todo[index]);
                  },
                  icon: const Icon(Icons.edit, color: Colors.green,),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteDialog(todo[index]);
                  },
                  icon: const Icon(Icons.delete_forever_rounded, color: Colors.red,),
                ),
              ],
            ),
            leading: todo[index].isCompleted
                ? const Icon(Icons.done)
                : const Icon(Icons.close_outlined),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToDoModelSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDeleteDialog(ToDo toDo){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Center(
            child: Text("Delete!",style: TextStyle(color:Colors.red),)),
        content: const Text("Are you sure want to delete the task?"),
        actions: [
          Row(
            children: [
              TextButton(onPressed: (){
                todo.remove(toDo);
                setState(() {});
                Navigator.pop(context);
              }, child: const Text("yes")),
              const Spacer(),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("NO")),

            ],
          )
        ],
      );
    });
  }

  void addToDoModelSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
              const Text("Add Task",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.green
              ),),
                  const SizedBox(height: 20,),
                  CustomTextField(hinText: "Enter title", controller: titleEditingController),
                  const SizedBox(height: 20,),
                  CustomTextField(
                      hinText: "Enter description",
                      controller: descriptionEditingController,
                    maxLine: 8,
                  ),
                  const SizedBox(height: 20,),
                  ReusableButton(text: "Add",onTab:(){
                    if (titleEditingController.text.trim().isNotEmpty &&
                        descriptionEditingController.text.trim().isNotEmpty) {
                      todo.add(ToDo(titleEditingController.text.trim(),
                          descriptionEditingController.text.trim(), false));
                      if (mounted) {
                        setState(() {});
                      }
                      titleEditingController.clear();
                      descriptionEditingController.clear();
                      Navigator.pop(context);
                    }
                  } ,)
                ],
              ),
            ),
          );
        });
  }

  void updateToDoModelSheet(ToDo todo) {

     titleEditingController.text = todo.title;
     descriptionEditingController.text = todo.description;


    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,

      context: context,
      builder: (context) {
        return SizedBox(
          height: 700,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                 const Text("Update ToDo",style: TextStyle(
                  fontWeight: FontWeight.bold,
                   fontSize: 30,
                   color: Colors.green

                ),),
                const SizedBox(height: 20,),
               CustomTextField( hinText: "title", controller: titleEditingController,),
                const SizedBox(height: 20,),
                CustomTextField(
                  hinText: "description",
                    controller: descriptionEditingController,
                  maxLine: 8,
                ),
                const SizedBox(height: 20,),
               ReusableButton(text: "Update", onTab: (){

                 if (titleEditingController.text.trim().isNotEmpty &&
                     descriptionEditingController.text.trim().isNotEmpty) {

                   todo.title = titleEditingController.text.trim();
                   todo.description = descriptionEditingController.text.trim();


                   if (mounted) {
                     setState(() {});
                   }
                   titleEditingController.clear();
                   descriptionEditingController.clear();
                   Navigator.pop(context);
                 }
               })
              ],
            ),
          ),
        );
      },
    );
  }


}






