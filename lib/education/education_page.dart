import 'package:flutter/material.dart';

enum ViewType { grid, list, card }

class EducationPage extends StatefulWidget {
  EducationPage({Key? key}) : super(key: key);

  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  ViewType _viewType = ViewType.grid;

  final List<Map<String, String>> categories = [
    {'title': 'الأمراض', 'image': 'assets/diseases.png'},
    {'title': 'الفطريات', 'image': 'assets/fungi.png'},
    {'title': 'لدينا قطط صغيرة', 'image': 'assets/kittens.png'},
    {'title': 'ما بعد التزاوج', 'image': 'assets/post_mating.png'},
    {'title': 'التزاوج', 'image': 'assets/mating.png'},
    {'title': 'التعقيم (الإخصاء)', 'image': 'assets/neutering.png'},
    {'title': 'اللقاحات', 'image': 'assets/vaccines.png'},
    {'title': 'السلوكيات', 'image': 'assets/behaviors.png'},
    {'title': 'النظافة', 'image': 'assets/hygiene.png'},
    {'title': 'التغذية', 'image': 'assets/nutrition.png'},
    {'title': 'ذكر & أنثى', 'image': 'assets/male_female.png'},
    {'title': 'القطط الهجينة', 'image': 'assets/hybrid_cats.png'},
    {'title': 'القطط النقية', 'image': 'assets/pure_cats.png'},
    {'title': 'وجدت قطة', 'image': 'assets/found_cat.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التعليم'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(_viewType == ViewType.grid
                ? Icons.grid_view
                : _viewType == ViewType.list
                    ? Icons.view_list
                    : Icons.view_module),
            onPressed: () {
              setState(() {
                if (_viewType == ViewType.grid) {
                  _viewType = ViewType.list;
                } else if (_viewType == ViewType.list) {
                  _viewType = ViewType.card;
                } else {
                  _viewType = ViewType.grid;
                }
              });
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_viewType) {
      case ViewType.grid:
        return _buildGridView();
      case ViewType.list:
        return _buildListView();
      case ViewType.card:
        return _buildCardView();
      default:
        return _buildGridView();
    }
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            // انتقال إلى صفحة التفاصيل
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      category['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            // انتقال إلى صفحة التفاصيل
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  category['image']!,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(
                category['title']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardView() {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            // انتقال إلى صفحة التفاصيل
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    category['image']!,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
