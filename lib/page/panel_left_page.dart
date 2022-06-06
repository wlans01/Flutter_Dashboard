import 'package:flutter/material.dart';
import 'package:flutter_dashboard/chart/pie_chart.dart';
import 'package:flutter_dashboard/const/const.dart';
import 'package:flutter_dashboard/layout/responsive_layout.dart';

class Todo {
  String name;
  bool enable;

  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _todos = [
    Todo(name: "CBNU 1호점", enable: true),
    Todo(name: "CBNU 2호점", enable: true),
    Todo(name: "CBNU 3호점", enable: true),
    Todo(name: "CBNU 4호점", enable: true),
    Todo(name: "CBNU 5호점", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Const.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Const.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Const.kPadding / 2,
                      top: Const.kPadding / 2,
                      right: Const.kPadding / 2),
                  child: Card(
                    color: Const.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        //leading: Icon(Icons.shopping_basket),
                        title: Text(
                          "오늘의 대여 현황",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "회수/대여 28/40",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "로스율 15%",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const PieChartSample2(),
                //오늘의 장사 잘되는곳
                Padding(
                  padding: const EdgeInsets.only(
                      right: Const.kPadding / 2,
                      bottom: Const.kPadding,
                      top: Const.kPadding,
                      left: Const.kPadding / 2),
                  child: Card(
                    color: Const.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const ListTile(
                            title: Text(
                          "오늘의 수거현황",
                          style: TextStyle(color: Colors.white),
                        )),
                        ...List.generate(
                          _todos.length,
                          (index) => CheckboxListTile(
                            title: Text(
                              _todos[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: _todos[index].enable,
                            onChanged: (newValue) {
                              setState(() {
                                _todos[index].enable = newValue ?? true;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
