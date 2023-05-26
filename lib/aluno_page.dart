import 'package:flutter/material.dart';
import 'crud_treinamentos.dart';
import 'crud_vagas.dart';
import 'cursos.dart';
import 'listagem_vagas.dart';

class StudentPageCall extends StatefulWidget {
  final String userType;

  StudentPageCall({required this.userType});

  @override
  StudentPage createState() => StudentPage();
}

class StudentPage extends State<StudentPageCall> {
  int _selectedIndex = 0;
  String _userType = '';

    List<Widget> getWidgetOptions() {
    return [
      CursosCall(userType: _userType),
      const Text('Testes'),
      ListagemVagasCall(userType: _userType),
      const Text('Atividades Concluídas'),
    ];
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextStyle style = const TextStyle(fontFamily: 'Nunito', fontSize: 20.9, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {

    _userType = widget.userType;
    final _widgetOptions = getWidgetOptions();

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Bem-vindo ALUNO, ${_userType}'), //<-- colocar $nomedisplay
        titleTextStyle: style,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        unselectedItemColor: Colors.white,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Testes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Vagas Divulgadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Atividades Concluídas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
