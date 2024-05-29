import 'package:flutter/material.dart';
import 'package:module_13assignment/style/style.dart';

import '../restAPI/restAPIClient.dart';
import 'ProductGridViewScreen.dart';
class productCreateForm extends StatefulWidget {
  const productCreateForm({super.key});
  @override
  State<productCreateForm> createState() => _productCreateFormState();
}
class _productCreateFormState extends State<productCreateForm> {
  Map<String,dynamic> FormValues={
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };
  bool Loading=false;

  InputOnChange(Mapkey,Textvalue){
    setState(() {
      FormValues.update(Mapkey, (value)=>value);
    });    
  }
  Future<void> formOnSubmit() async {
    setState(() {
      Loading = true;
    });

    bool success = await ProductCreateRequest(FormValues);
    if (success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProductGridViewScreen()),
            (route) => false,
      );
    }
    setState(() {
      Loading = false;
    });
  }


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  String? _selectedQuantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
        centerTitle: true,
        backgroundColor: colormaroon,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Form(
            key: _formkey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: createProductFormDecoration('Product Name'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return "Please Write Your Product Name!";
                      }
                      return null;
                    },
                    onChanged: (Textvalue){
                      InputOnChange("ProductName", Textvalue);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    decoration: createProductFormDecoration('Product Code'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value ==null || value.trim().isEmpty){
                        return "Please Write Your Product Code!";
                      }
                      return null;
                    },
                    onChanged: (Textvalue){
                      InputOnChange("ProductCode", Textvalue);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _unitPriceController,
                    keyboardType: TextInputType.number,
                    decoration: createProductFormDecoration('Unit Price'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value == null || value.trim().isEmpty){
                        return "Please Write Unit Price of Product!";
                      }
                      return null;
                    },
                    onChanged: (Textvalue){
                      InputOnChange("UnitPrice", Textvalue);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /*TextFormField(
                    controller: _qtyController,
                      keyboardType: TextInputType.number,
                    decoration: createProductFormDecoration('Quantity'),
                    validator: (String ? value){
                      if(value==null || value.trim().isEmpty){
                        return "Please Write Your Product Quantity";
                      }
                      return null;
                    },
                  ),*/
                  AppDropdownStyle(
                    DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      value: _selectedQuantity,

                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text("Select Quantity"),
                        ),
                        DropdownMenuItem(
                          value: '1',
                          child: Text("1 pcs"),
                        ),
                        DropdownMenuItem(
                          value: '2',
                          child: Text("2 pcs"),
                        ),
                        DropdownMenuItem(
                          value: '3',
                          child: Text("3 pcs"),
                        ),
                        DropdownMenuItem(
                          value: '4',
                          child: Text("4 pcs"),
                        ),
                      ],
                      onChanged: (value) {
                        InputOnChange("UnitPrice", value);
                        setState(() {
                          _selectedQuantity = value;
                        });
                      },
                      isExpanded: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select a quantity";
                        }
                        return null;
                      },
                    ),
                  ),

                  /*AppDropdownStyle(

                    DropdownButton(
                      value: "",
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text("Select Quantity"),
                        ),
                        DropdownMenuItem(
                          value: '1',
                          child: Text("1pcs"),
                        ),
                        DropdownMenuItem(
                          value: '2',
                          child: Text("2 pcs"),
                        ),
                        DropdownMenuItem(
                          value: '3',
                          child: Text("3 pcs"),
                        ),
                        DropdownMenuItem(
                          value: '4',
                          child: Text("4 pcs"),
                        ),
                      ],
                      onChanged: (value) {},
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),*/
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _totalPriceController,
                      keyboardType: TextInputType.number,
                    decoration: createProductFormDecoration('Total Price'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return "Please Write Total Price Of The Product!";
                      }
                      return null;
                    },
                    onChanged: (Textvalue){
                      InputOnChange("TotalPrice", Textvalue);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _imageController,
                    keyboardType: TextInputType.url,
                    decoration: createProductFormDecoration('Product Image'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return "Please Give The Link Of Your Product Image!";
                      }
                      return null;
                    },
                    onChanged: (Textvalue){
                      InputOnChange("Img", Textvalue);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        fixedSize:const Size.fromWidth(double.maxFinite),
                        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: colormaroon,
                        foregroundColor: colorwhite
                      ),
                      onPressed: () {
                        if(_formkey.currentState!.validate()){
                          formOnSubmit();
                        }
                      },
                      /*style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the desired border radius
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colormaroon),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),*/
                      child:  Loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "Submit",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();
    _totalPriceController.dispose();
    _unitPriceController.dispose();
    _codeController.dispose();
    _qtyController.dispose();
    super.dispose();
  }
}
