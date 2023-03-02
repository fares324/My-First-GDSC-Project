import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class animatedList extends StatefulWidget {
  const animatedList({super.key});

  @override
  State<animatedList> createState() => _animatedListState();
}

class _animatedListState extends State<animatedList> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, 'Item ${_items.length + 1}');
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text(
              'Deleted',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 213, 185, 185),
      body:Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add
           ,color: Colors.white,
           size: 30,
           )),
          Expanded(
              child: AnimatedList(
            key: _key,
            initialItemCount: 0,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.purple,
                  child: ListTile(
                    title: Text(
                      _items[index],
                      style: const TextStyle(fontSize: 24),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _removeItem(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
