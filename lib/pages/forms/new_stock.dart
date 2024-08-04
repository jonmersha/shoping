import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/RemoteService/controller/stock_bin_controller.dart';
import 'package:shop/RemoteService/controller/store_controller.dart';
import 'package:shop/components/text_form_field.dart';
import 'package:shop/components/text_widget.dart';
import 'package:shop/utils/app_constants.dart';

class NewStockForm extends StatefulWidget {
  final product;

  const NewStockForm({super.key, required this.product});

  @override
  _NewStockFormState createState() => _NewStockFormState();
}

class _NewStockFormState extends State<NewStockForm> {
  dynamic _selectedStore;
  final _formKey = GlobalKey<FormState>();
  // Form fields controllers
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _profitMarginController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    _unitPriceController.dispose();
    _profitMarginController.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    double stockBalance=double.parse(_quantityController.text.toString())+widget.product.quantity;

    final Map<String, dynamic> data =

        {
      "product_id": widget.product.id,
      "previous_quantity": widget.product.quantity,
      "current_quantity": int.parse(_quantityController.text.toString()),
      "stock_balance": stockBalance,
      "merchant_id": 1,
      "store_id": _selectedStore.id,
      "previous_price": widget.product.unitPrice,
      "current_price": double.parse(_unitPriceController.text.toString()),
      "registered_by": 1
    };

    Get.find<StockBinController>().addData('$ADD/4', data);
    navigateTo();
  }


  @override
  Widget build(BuildContext context) {
    Get.find<StoreController>().getList('$DATA/1/1');
    _unitPriceController.text=widget.product.unitPrice.toString();
    _profitMarginController.text=widget.product.profitMargin.toString();

   // _quantityController.text = '0';
    double sellingPrice= price(double.parse(widget.product.profitMargin.toString()),double.parse(widget.product.unitPrice.toString()));
    double withVat=(1+0.15)*sellingPrice;
    String val=withVat.toStringAsFixed(2);
    print(val);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
            Container(

            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoText(label:'Product Name',text:widget.product.productName),
                infoText(label:'Description',text:widget.product.descriptions),
                infoText(label:'Existing',text:widget.product.quantity),
                infoText(label:'Unit Price',text:widget.product.unitPrice),
                infoText(label:'Profit Margin %',text:widget.product.profitMargin),
                infoText(label:'Selling Price',text:'$sellingPrice'),
                infoText(label:'Selling Price+VAT 15%',text:val),
              ],
            ),
          ),
              const SizedBox(height: 10,),
              GetBuilder<StoreController>(builder: (controller) {
                return controller.isLoaded
                    ?
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration:  BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,

                  ),
                  child: DropdownButtonHideUnderline(
                    child: 
                    buildDropdownButton(controller),
                  ),
                )
                    : Container(
                        child: const Text('is Empty Add Your Store'),
                      );
              }),
              Row(
                children: [

                  Flexible(
                    child: buildTextFormFieldText(
                        _quantityController, 'Current Amount', 'Enter Amount'),
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: buildTextFormFieldText(
                        _unitPriceController, 'Unit Price', 'Enter Unit price'),
                  ),

                ],
              ),

              buildTextFormFieldText(_profitMarginController, 'Profit Margin',
                  'inter profit margin%'),
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

  DropdownButton<dynamic> buildDropdownButton(StoreController controller) {
    return DropdownButton<dynamic>(
                    icon: const Icon(Icons.arrow_downward, color: Colors.blue),
                    iconSize: 24,
                    elevation: 16,
                    hint:   const Text('Select Your Store'),
                   // value: _selectedStore,
                    //dropdownColor: Colors.blue[100],
                    style: const TextStyle(color: Colors.blue, fontSize: 16),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedStore = newValue!;
                        print(_selectedStore.id!);
                      });
                    },
                    items: controller.list.map((dynamic store) {
                      return DropdownMenuItem<dynamic>(
                        value: store,
                        child: Text('${store.name!}     Location-- ${store.adress!}'),
                      );
                    }).toList(),
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
              : controller.isPostedError
                  ? responseWidgetError(context)
                  : const Center(
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                  color: Colors.green, borderRadius: BorderRadius.circular(30)),
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
            'Error Updating Your Stock',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
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

double price(double pr, double price){
 double  prs=pr/100;
 double beforeVat=(1+prs)*price;
  return beforeVat;
}
double discount(double pr, double price){
  double  prs=pr/100;
  double beforeVat=(1-prs)*price;
  return beforeVat;
}

