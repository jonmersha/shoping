import 'package:flutter/material.dart';
import 'package:shop/components/title_text_widget.dart';
import 'package:shop/pages/registrations/registrations.dart';
import 'package:shop/utils/app_constants.dart';


class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _merchantController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _imageNameController = TextEditingController();

  // Checkboxes state
  final bool _hasSubTask = false;
  final bool _isProgressive = false;

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _merchantController.dispose();
    _descriptionController.dispose();
    _statusController.dispose();
    _imageNameController.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    final Map<String, dynamic> data = {
     // "id":1, //int.parse(_idController.text),
      "name": _nameController.text,
      "merchant_id": 1,//_merchantController.text,
      "description": _descriptionController.text,
      "status":1,// _statusController.text,
      "image_name":'placeholder.jpg'// _imageNameController.text,

    };
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegistrationPage(path: '$CATEGORY/add',data:data, message: 'Category Created!!'),
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
              const TitleText(text:'Product Category +'),
             // buildTextFormField(_ownerIdController, 'ID', 'Enter Owner ID'),
              buildTextFormField(_nameController, 'Title', 'Enter Title'),
              buildTextFormField(_descriptionController, 'Descriptions', 'Enter Descriptions', maxLines: 3),
             // buildTextFormField(_imageNameController, 'Image', 'upload immages'),
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


