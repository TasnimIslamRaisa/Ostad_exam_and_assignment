import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_13assignment/screens/productCreateForm.dart';
import 'package:module_13assignment/screens/update_product_details.dart';
import '../Style/Style.dart';
import '../restAPI/restAPIClient.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);
  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List ProductList=[];
  bool Loading=true;


  @override
  void initState(){

    super.initState();
    CallData();
  }

  CallData() async {
    Loading = true;
    setState(() {}); // Trigger rebuild to show loading indicator

    var data = await ProductGridViewListRequest();

    print("API Response: $data"); // Log the response

    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {Loading=true;});
                await ProductDeleteRequest(id);
                await CallData();

              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),

            ],
          );

        }
    );
  }

  GotoUpdate(context,productItem){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (builder)=>
                update_product_details(productItem)
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),
        centerTitle: true,
        backgroundColor: colormaroon,
        foregroundColor: Colors.white,),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: Loading?(
                  const Center(
                      child: CircularProgressIndicator(),)):
              RefreshIndicator(
                  onRefresh: () async {
                    await CallData();
                  },
                  child: GridView.builder(
                      gridDelegate: ProductGridViewStyle(),
                      itemCount: ProductList.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.fill)),
                              Container(
                                padding: const EdgeInsets.fromLTRB(5,5,5,8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ProductList[index]['ProductName']),
                                    const SizedBox(height: 7),
                                    Text("Price: "+ProductList[index]['UnitPrice']+" BDT"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(onPressed: (){
                                          GotoUpdate(context,ProductList[index]);
                                        }, child: const Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,)),
                                        const SizedBox(width: 4),
                                        OutlinedButton(onPressed: (){
                                          DeleteItem(ProductList[index]['_id']);
                                        },
                                        child:const Icon(CupertinoIcons.delete,size: 18,))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  )
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colormaroon,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> const productCreateForm(),
            ),
          );
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}