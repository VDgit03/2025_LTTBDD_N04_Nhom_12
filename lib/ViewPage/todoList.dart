import 'package:flutter/material.dart';
import 'SaveData.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _tasks = [];
  final _data = SaveData();

  void _addTask() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _data.tasks.add({'title': _controller.text.trim(), 'done': false});
      _controller.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _data.tasks[index]['done'] = !_data.tasks[index]['done'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // cách lề trong
      decoration: BoxDecoration(
        color: Colors.white, // nền trắng (tùy chỉnh)
        borderRadius: BorderRadius.circular(12), // bo góc
        border: Border.all(
          color: const Color.fromARGB(255, 126, 153, 200), // màu viền
          width: 2, // độ dày viền
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tieu de
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "To-Do List",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.orange),
                onPressed: _addTask,
              ),
            ],
          ),
          // o nhap cong viec moi
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Nhap cong viec moi',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: _addTask,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),

          SizedBox(height: 10),

          // danh sach cong viec
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: _data.tasks.length,
              itemBuilder: (context, index) {
                final task = _data.tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(
                      task['title'],
                      style: TextStyle(
                        decoration: _data.tasks[index]['done']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        task['done']
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: task['done'] ? Colors.green : Colors.grey,
                      ),
                      onPressed: () => _toggleTask(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
