import 'package:flutter/material.dart';

class StoreDropdown extends StatefulWidget {
  final List<dynamic> merchantStore;

  const StoreDropdown({super.key,required this.merchantStore});
  @override
  _StoreDropdownState createState() => _StoreDropdownState();
}

class _StoreDropdownState extends State<StoreDropdown> {
  dynamic _selectedStore;

  @override
  Widget build(BuildContext context) {
    List<dynamic> merchantStore =widget.merchantStore;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,

      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          icon: const Icon(Icons.arrow_downward, color: Colors.blue),
          iconSize: 24,
          elevation: 16,
          hint:   const Text('Select Your Store'),
          value: _selectedStore,
          //dropdownColor: Colors.blue[100],
          style: const TextStyle(color: Colors.blue, fontSize: 16),
          onChanged: (dynamic newValue) {
            setState(() {
              _selectedStore = newValue!;
              print(_selectedStore.name!);
            });
          },
          items: merchantStore.map((dynamic store) {
            return DropdownMenuItem<dynamic>(
              value: store,
              child: Text('Name ${store.name!} Location-- ${store.adress!}'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
