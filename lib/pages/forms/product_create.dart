import 'package:flutter/material.dart';
import 'package:shop/components/title_text_widget.dart';
import 'package:shop/pages/product_registrations.dart';
import 'package:shop/utils/app_constants.dart';


class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController _ownerIdController = TextEditingController();
  final TextEditingController _objNameController = TextEditingController();
  final TextEditingController _descriptionsController = TextEditingController();
  final TextEditingController _objStartDateController = TextEditingController();
  final TextEditingController _objEndDateController = TextEditingController();

  // Checkboxes state
  bool _hasSubTask = false;
  bool _isProgressive = false;

  @override
  void dispose() {
    _ownerIdController.dispose();
    _objNameController.dispose();
    _descriptionsController.dispose();
    _objStartDateController.dispose();
    _objEndDateController.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    final Map<String, dynamic> data = {
      "owner_id": int.parse(_ownerIdController.text),
      "obj_name": _objNameController.text,
      "descriptions": _descriptionsController.text,
      "obj_start_date": _objStartDateController.text,
      "obj_end_date": _objEndDateController.text,
      "has_sub_task": _hasSubTask ? 1 : 0,
      "is_progressive": _isProgressive ? 1 : 0,
    };
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductRegistrationPage(path: '$PRODUCT/add',data:data),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const TitleText(text:'Create New Objective'),
              buildTextFormField(_ownerIdController, 'Owner ID', 'Enter Owner ID'),
              buildTextFormField(_objNameController, 'Objective/Title', 'Enter Objective Name'),
              buildTextFormField(_descriptionsController, 'Descriptions', 'Enter Descriptions', maxLines: 3),
              buildTextFormField(_objStartDateController, 'Object Start Date', 'Enter Object Start Date (YYYY-MM-DD)'),
              buildTextFormField(_objEndDateController, 'Object End Date', 'Enter Object End Date (YYYY-MM-DD)'),
              CheckboxListTile(
                title: const Text('Has Sub Task'),
                value: _hasSubTask,
                onChanged: (bool? value) {
                  setState(() {
                    _hasSubTask = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Is Progressive'),
                value: _isProgressive,
                onChanged: (bool? value) {
                  setState(() {
                    _isProgressive = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendData();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(TextEditingController controller, String label, String hint, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}


