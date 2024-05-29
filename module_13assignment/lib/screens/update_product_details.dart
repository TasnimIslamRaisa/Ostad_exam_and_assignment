import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:module_13assignment/style/style.dart';

import '../restAPI/restAPIClient.dart';
import 'ProductGridViewScreen.dart';
class update_product_details extends StatefulWidget {
  final Map productItem;
  const update_product_details(this.productItem);

  @override
  State<update_product_details> createState() => _update_product_detailsState();
}

class _update_product_detailsState extends State<update_product_details> {

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  Map<String,dynamic> FormValues={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};

  bool Loading=false;

  @override
  void initState(){
    setState(() {
      FormValues.update("Img", (value) => widget.productItem['Img']);
      FormValues.update("ProductCode", (value) =>  widget.productItem['ProductCode']);
      FormValues.update("ProductName", (value) => widget.productItem['ProductName']);
      FormValues.update("Qty", (value) => widget.productItem['Qty']);
      FormValues.update("TotalPrice", (value) => widget.productItem['TotalPrice']);
      FormValues.update("UnitPrice", (value) =>widget.productItem['UnitPrice']);
    });
  }

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
      setState(() {
        Loading=true;
      });
      await ProductUpdateRequest(FormValues,widget.productItem['_id']);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=> ProductGridViewScreen()),
              (Route route)=>false
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
        centerTitle: true,
        backgroundColor: colormaroon,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Form(
            key: _formkey,
              child:Loading?(Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue:FormValues['ProductName'],
                      onChanged: (Textvalue){
                        InputOnChange("ProductName",Textvalue);
                      },
                      decoration: createProductFormDecoration('Product Name'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value){
                        if(value==null || value.trim().isEmpty){
                          return "Please Write Your Product Name!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      initialValue:FormValues['ProductCode'],
                      onChanged: (Textvalue){
                        InputOnChange("ProductCode",Textvalue);
                      },
                      decoration: createProductFormDecoration('Product Code'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value){
                        if(value ==null || value.trim().isEmpty){
                          return "Please Write Your Product Code!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      initialValue:FormValues['Img'],
                      onChanged: (Textvalue){
                        InputOnChange("Img",Textvalue);
                      },
                      decoration: createProductFormDecoration('Product Image'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value){
                        if(value==null || value.trim().isEmpty){
                          return "Please Give The Link Of Your Product Image!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      initialValue:FormValues['UnitPrice'],
                      onChanged: (Textvalue){
                        InputOnChange("UnitPrice",Textvalue);
                      },
                      decoration: createProductFormDecoration('Unit Price'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value){
                        if(value == null || value.trim().isEmpty){
                          return "Please Write Unit Price of Product!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      initialValue:FormValues['TotalPrice'],
                      onChanged: (Textvalue){
                        InputOnChange("TotalPrice",Textvalue);
                      },
                      decoration: createProductFormDecoration('Total Price'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value){
                        if(value==null || value.trim().isEmpty){
                          return "Please Write Total Price Of The Product!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    AppDropdownStyle(
                        DropdownButton(
                          value:FormValues['Qty'] ,
                          items:[
                            DropdownMenuItem(child: Text('Select Qt'),value: "",),
                            DropdownMenuItem(child: Text('1 pcs'),value: "1 pcs",),
                            DropdownMenuItem(child: Text('2 pcs'),value: '2 pcs',),
                            DropdownMenuItem(child: Text('3 pcs'),value: '3 pcs',),
                            DropdownMenuItem(child: Text('4 pcs'),value: '4 pcs',),
                          ],
                          onChanged: (Textvalue){
                            InputOnChange("Qty",Textvalue);
                          },
                          underline: Container(),
                          isExpanded: true,
                        )
                    ),

                    SizedBox(height: 20),

                    Container(
                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize:const Size.fromWidth(double.maxFinite),
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: colormaroon,
                                foregroundColor: colorwhite
                            ),
                            onPressed: (){
                              if(_formkey.currentState!.validate()){

                              }
                              FormOnSubmit();
                            },
                          child: const Text("Submit",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                        )
                    )
                  ],
                ),
              )))
          )
        ],
      ),
    );
  }
}