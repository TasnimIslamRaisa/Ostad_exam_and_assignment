import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets_path.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('title'),
        title: SvgPicture.asset(AssetsPath.appLogoNav,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.phone)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: SearchWidget(searchController: TextEditingController(),),
          ),
        ],
      ),
    );
  }
}


