import 'package:change_notifier/app/pages/home_page/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
      ),
      body: Stack(
        children: [
          _homeController.names.isEmpty
              ? const Center(
                  child: Text('Lista Vazia'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 145),
                  itemCount: _homeController.names.length,
                  itemBuilder: (_, index) => ListTile(
                    leading: CircleAvatar(
                      child: Center(
                        child: Text(
                          _homeController.names[index][0],
                        ),
                      ),
                    ),
                    title: Text(
                      _homeController.names[index],
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: const Offset(0, -5),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Digite um nome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: GestureDetector(
                        onTap: () {
                          _homeController.addName(name: _nameController.text);
                          _nameController.clear();
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
