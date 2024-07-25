import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/components/title_text_widget.dart';
import 'package:shop/utils/app_constants.dart';

class CreateProduct extends StatefulWidget {
  final category;

  const CreateProduct({super.key, required this.category});

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionsController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitsOfMeasureController =
      TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _minThresholdController = TextEditingController();
  final TextEditingController _profitMarginController = TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionsController.dispose();
    _quantityController.dispose();
    _unitsOfMeasureController.dispose();
    _unitPriceController.dispose();
    _minThresholdController.dispose();
    _profitMarginController.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    final Map<String, dynamic> data = {
      "category": widget.category.id,
      "merchant_id": 1,
      "product_name": _productNameController.text,
      "descriptions": _descriptionsController.text,
      "quantity": double.parse(_quantityController.text),
      "units_of_measure": _unitsOfMeasureController.text,
      "unit_price": double.parse(_unitPriceController.text),
      "profit_margin": _profitMarginController.text,
      "min_threshold": int.parse(_minThresholdController.text),
    };
    Get.find<ProductController>().addData('$PRODUCT/add', data);
    navigateTo();
  }

   String? _selectedItem;

  final List<String> _dropdownItems = [
    'KG',
    'Pcs',
    'Liter',
    'Quintal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              //const TitleText(text: 'Create new product'),
              Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                      NetworkImage('$imagePath/${widget.category.imageName}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                      'Product Category:${widget.category.name.toString()}'),),
              //Text('Product Category:${widget.category.name.toString()}'),

              buildTextFormField(
                  _productNameController, 'Product Name', 'Enter Name'),
              buildTextFormField(_descriptionsController, 'Product Description',
                  'Enter Descriptions',
                  maxLines: 3),
              DropdownButton<String>(
                value: _selectedItem,
                hint: Text('Select an item'),
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },),
              buildTextFormField(
                  _unitsOfMeasureController, 'Units Of Measure', 'Pcs'),
              buildTextFormField(_quantityController, 'Quantity',
                  'inter product quantity(1,2,3)'),
              buildTextFormField(
                  _unitPriceController, 'Unit Price', 'Enter Unit price'),
              buildTextFormField(_profitMarginController, 'Profit Margin',
                  'inter profit margin %'),
              buildTextFormField(
                  _minThresholdController, 'Threshold', 'inter min threshold'),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendData();
                  }
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      TextEditingController controller, String label, String hint,
      {int maxLines = 1}) {
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

  navigateTo() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Registration(),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({
    super.key,
  });

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return controller.isPosted
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your Product Is Registered',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const Icon(
                        Icons.done_outlined,
                        size: 150,
                        color: Colors.green,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.center,
                          child: const Text(
                            'Go To Home',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
    );
  }
}
