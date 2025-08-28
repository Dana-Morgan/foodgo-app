import 'package:flutter/material.dart';

import '../../di.dart';
import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String selectedCategory = "All";
  late CategoryRepository categoryRepository;
  late Future<Set<String>> categories;

  @override
  void initState() {
    super.initState();
    categoryRepository = CategoryRepository(locator<ProductRepository>());
    categories = categoryRepository.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foodgo',
              style: TextStyle(
                color: Color(0xFF3C2F2F),
                fontSize: 45,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lobster',
              ),
            ),
            Text(
              "Order your favourite food!",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6A6A6A),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/mask-group.png',
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SearchBar(
                      leading: Icon(Icons.search),
                      hintText: 'Search',
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFEF2A39),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.tune, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 66,
            child: FutureBuilder<Set<String>>(
              future: categories,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> categoryList = snapshot.data!.toList();
                  categoryList.insert(0, 'All');
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected = selectedCategory == categoryList[index];
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                            selectedCategory = categoryList[index];
                            print(selectedCategory);
                          });
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.red
                                : const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              categoryList[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Color(0xFF6A6A6A),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                      Text(' error while fetching products'),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          Column(children: []),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {},
              ),
              SizedBox(width: 120),
              IconButton(
                icon: Icon(Icons.chat, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          backgroundColor: Colors.red,
          child: Icon(Icons.add, size: 35, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
