import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/form_c.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() {
    return _FormsState();
  }
}

final List<String> _dropdown = [
  'A',
  'B',
  'C',
];
final List<String> _dropdown2 = [
  '1',
  '2',
  '3',
];

class _FormsState extends State<Forms> {
  final _titleController = TextEditingController();
  final _ageController = TextEditingController();
  Category _selectedCategory = Category.female;
  var _selectedSubCategory = 'A';

  var options = [..._dropdown];
  //dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            TextField(
              controller: _ageController,
              maxLength: 3,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Age'),
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;

                      if (value == Category.female) {
                        options = _dropdown2;
                        _selectedSubCategory = '1';
                      } else if (value == Category.male) {
                        options = _dropdown;
                        _selectedSubCategory = 'A';
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                DropdownButton(
                  value: _selectedSubCategory,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedSubCategory = value;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_ageController.text);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
