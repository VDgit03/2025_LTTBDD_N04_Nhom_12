import 'package:flutter/material.dart';
import 'SaveData.dart';

class TodoList extends StatefulWidget {
  final int pageNumber;
  const TodoList({super.key, required this.pageNumber});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _controller = TextEditingController();
  final _data = SaveData();

  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks = _data.getTasks(widget.pageNumber);
  }

  void _addTask() {
    final taskText = _controller.text.trim();
    if (taskText.isNotEmpty) {
      setState(() {
        _tasks.add({'text': taskText, 'done': false});
        _data.saveTasks(widget.pageNumber, _tasks);
        _controller.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _data.saveTasks(widget.pageNumber, _tasks);
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['done'] = !_tasks[index]['done'];
      _data.saveTasks(widget.pageNumber, _tasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
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
            ],
          ),
          // o nhap cong viec moi
          const SizedBox(height: 10),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'To do something...',
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.blueGrey,
                  size: 30,
                ),
                onPressed: _addTask,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onSubmitted: (_) => _addTask(), // nhan enter de them
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Dismissible(
                  key: Key(task['text']),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) => _removeTask(index),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(
                        task['text'],
                        style: TextStyle(
                          decoration: task['done']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: task['done'] ? Colors.grey : Colors.black,
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
