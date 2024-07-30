import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/RemoteService/controller/store_controller.dart';
import 'package:shop/components/stor_drop.dart';
import 'package:shop/components/title_text_widget.dart';
import 'package:shop/model/Store.dart';
import 'package:shop/utils/app_constants.dart';

class NewStockForm extends StatefulWidget {
  final product;

  const NewStockForm({super.key, required this.product});

  @override
  _NewStockFormState createState() => _NewStockFormState();
}

class _NewStockFormState extends State<NewStockForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionsController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _preveQuantityController =
      TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _minThresholdController = TextEditingController();
  final TextEditingController _profitMarginController = TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionsController.dispose();
    _quantityController.dispose();
    _preveQuantityController.dispose();
    _unitPriceController.dispose();
    _minThresholdController.dispose();
    _profitMarginController.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    final Map<String, dynamic> data =
    // {
    //   "category": widget.product.id,
    //   "merchant_id": 1,
    //   "product_name": _productNameController.text,
    //   "descriptions": _descriptionsController.text,
    //   "quantity": double.parse(_quantityController.text),
    //   "units_of_measure": _unitsOfMeasureController.text,
    //   "unit_price": double.parse(_unitPriceController.text),
    //   "profit_margin": _profitMarginController.text,
    //   "min_threshold": int.parse(_minThresholdController.text),
    // };

    {
      "product_id": widget.product.id,
      "previous_quantity": 123,
      "current_quantity": 1000,
      "stock_balance": 0,
      "merchant_id": 1,
      "store_id": 1,
      "previous_price": 100,
      "current_price": 120,
      "registered_by": 1
  };



    Get.find<ProductController>().addData('$ADD/2', data);
    print(data);
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
    Get.find<StoreController>().getList('$DATA/1/1');
    _quantityController.text='0';

    return Scaffold(
      appBar: AppBar(title: Text('Stock Card'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              GetBuilder<StoreController>(
              builder: (controller) {
              return controller.isLoaded?
              StoreDropdown(merchantStore:controller.list)
                      :Container(child: Text('is Empty Add Your Store'),);}),

             Text('Existing Quantity: ${widget.product.quantity}'),

              buildTextFormField(_quantityController, 'Enter Current Amount',
                  '12'),
              TextFormField(controller: _quantityController,keyboardType: TextInputType.number,),


              Text('Balance: ${ int.parse(widget.product.quantity.toString())+int.parse(_quantityController.text)}'),

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
              ? responseWidget(context)
              : controller.isPostedError?responseWidgetError(context):

          const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
    );
  }

  Center responseWidget(BuildContext context) {
    return Center(
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
              );
  }
  Center responseWidgetError(BuildContext context) {
    return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Error Creating Your Products',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Icon(
                      Icons.error_outline,
                      size: 150,
                      color: Colors.red,
                    ),
                    InkWell(
                      onTap: () {
                        //Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        alignment: Alignment.center,
                        child: const Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}
