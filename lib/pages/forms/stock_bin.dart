import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/components/title_text_widget.dart';
import 'package:shop/utils/app_constants.dart';


class CreateStockBIN extends StatefulWidget {
  final product;
  const CreateStockBIN({super.key, required this.product});
  @override
  _CreateStockBINState createState() => _CreateStockBINState();
}

class _CreateStockBINState extends State<CreateStockBIN> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  //final
  final TextEditingController _currentQuantityController = TextEditingController();

  final TextEditingController _storeIdController = TextEditingController();
  //final TextEditingController _previousPriceController = TextEditingController();
  final TextEditingController _currentPriceController = TextEditingController();
  final TextEditingController _regDateController = TextEditingController();
 // final TextEditingController _registeredByController = TextEditingController();

  @override
  void dispose() {
    _currentQuantityController.dispose();
    _storeIdController.dispose();
    _currentPriceController.dispose();
    _regDateController.dispose();
    super.dispose();
    super.dispose();
  }
  Future<void> _sendData() async {
    final Map<String, dynamic> data = {
      "product_id": 2,
      "previous_quantity": 123,
      "current_quantity": _currentQuantityController.text,
      "stock_balance": 200,
      "merchant_id": 1,
      "store_id": _storeIdController.text,
      "previous_price": 100,
      "current_price": _currentPriceController.text,
      "reg_date": "2024-07-10T12:32:01.000Z",
      "registered_by": 1
    };
    Get.find<ProductController>().addData('$PRODUCT/add',data);
    navigateTo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const TitleText(text:'Create new product'),
              Text('Product Category:${widget.product.name.toString()}'),
              Text('Exsting Ammout:'),
              buildTextFormField(_currentQuantityController, 'current Quantity ', 'Enter quantity of the Products'),
              Text('Stock Balance:'),
              buildTextFormField(_storeIdController, 'Product Description', 'Enter Descriptions', maxLines: 3),
              Text('Previuse:'),
              buildTextFormField(_currentPriceController, 'Units Of Measure', 'Pcs'),
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
  navigateTo(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Registration(),
      ),
    );

  }
}


class Registration extends StatefulWidget {
  const Registration({super.key,});
  @override
  State<Registration> createState() =>
      _RegistrationState();
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
                  onTap: (){
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
                    child:  const Text(
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



