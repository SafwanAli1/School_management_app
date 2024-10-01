import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:school_management_system/const/cards.dart';
import 'package:school_management_system/const/navbar.dart'; // Import the TeacherCard

class TeacherList extends StatefulWidget {
  const TeacherList({super.key});

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  static const _pageSize = 3;
  final PagingController<int, Map<String, String>> _pagingController = PagingController(firstPageKey: 0);

  List<Map<String, String>> _teacherData = [];
  List<Map<String, String>> _filteredTeacherData = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _pagingController.addPageRequestListener((pageKey) {
      _loadPage(pageKey);
    });

    // Listen to search controller changes to implement AJAX-like search
    _searchController.addListener(() {
      setState(() {
        // Update the filtered data based on the search input
        _filteredTeacherData = _filterData(_searchController.text);
        _pagingController.refresh(); // Refresh pagination on search input
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    setState(() {
      _teacherData = _getTeacherData();
      _filteredTeacherData = _teacherData;
    });
  }

  Future<void> _loadPage(int pageKey) async {
    try {
      // Simulating delay for loading page data
      await Future.delayed(const Duration(milliseconds: 500));

      // Ensure we're paginating from the filtered data
      final isLastPage = pageKey + _pageSize >= _filteredTeacherData.length;
      final newItems = _filteredTeacherData.skip(pageKey).take(_pageSize).toList();

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  List<Map<String, String>> _getTeacherData() {
    return [
      // Sample data
      {
        'id': '00001',
        'firstName': 'Fuzail',
        'lastName': 'Siddiqui',
        'email': 'fuzail.siddiqui@gmail.com',
        'phone': '+1 0123456789',
        'experience': '50 Years',
        'gender': 'Male',
        'maritalStatus': 'Single',
        'qualification': 'Developer',
        'image': 'assets/images/Profile.png',
        'Status': 'Active',
        'dateOfJoining': '2020-01-15', // Add date of joining
      },
      {
        'id': '00002',
        'firstName': 'Zaid',
        'lastName': 'Siddiqui',
        'email': 'zaid.siddiqui@gmail.com',
        'phone': '+1 0123456789',
        'experience': '5 month',
        'gender': 'Male',
        'maritalStatus': 'Divorced',
        'qualification': 'Designer',
        'image': 'assets/images/Profile.png',
        'Status': 'Inactive',
        'dateOfJoining': '2019-03-22', // Add date of joining
      },
      {
        'id': '00003',
        'firstName': 'Sara',
        'lastName': 'Khan',
        'email': 'sara.khan@gmail.com',
        'phone': '+1 0987654321',
        'experience': '6 Years',
        'gender': 'Female',
        'maritalStatus': 'Single',
        'qualification': 'BSc',
        'image': 'assets/images/Profile.png',
        'Status': 'Active',
        'dateOfJoining': '2018-07-30', // Add date of joining
      },
      {
        'id': '00004',
        'firstName': 'Ahmed',
        'lastName': 'Raza',
        'email': 'ahmed.raza@gmail.com',
        'phone': '+1 1234567890',
        'experience': '3 Years',
        'gender': 'Male',
        'maritalStatus': 'Married',
        'qualification': 'M.Ed',
        'image': 'assets/images/Profile.png',
        'Status': 'Inactive',
        'dateOfJoining': '2021-08-10', // Add date of joining
      },
      {
        'id': '00005',
        'firstName': 'Fatima',
        'lastName': 'Ali',
        'email': 'fatima.ali@gmail.com',
        'phone': '+1 2345678901',
        'experience': '7 Years',
        'gender': 'Female',
        'maritalStatus': 'Divorced',
        'qualification': 'PhD',
        'image': 'assets/images/Profile.png',
        'Status': 'Active',
        'dateOfJoining': '2016-02-25', // Add date of joining
      },
      {
        'id': '00006',
        'firstName': 'Omar',
        'lastName': 'Farooq',
        'email': 'omar.farooq@gmail.com',
        'phone': '+1 3456789012',
        'experience': '2 Years',
        'gender': 'Male',
        'maritalStatus': 'Single',
        'qualification': 'MSc',
        'image': 'assets/images/Profile.png',
        'Status': 'Active',
        'dateOfJoining': '2022-11-05', // Add date of joining
      },
      {
        'id': '00007',
        'firstName': 'Hina',
        'lastName': 'Javed',
        'email': 'hina.javed@gmail.com',
        'phone': '+1 4567890123',
        'experience': '8 Years',
        'gender': 'Female',
        'maritalStatus': 'Married',
        'qualification': 'MA',
        'image': 'assets/images/Profile.png',
        'Status': 'Inactive',
        'dateOfJoining': '2015-06-15', // Add date of joining
      },
      {
        'id': '00008',
        'firstName': 'Ali',
        'lastName': 'Naseem',
        'email': 'ali.naseem@gmail.com',
        'phone': '+1 5678901234',
        'experience': '4 Years',
        'gender': 'Male',
        'maritalStatus': 'Single',
        'qualification': 'B.Ed',
        'image': 'assets/images/Profile.png',
        'Status': 'Active',
        'dateOfJoining': '2020-03-12', // Add date of joining
      },
      {
        'id': '00010',
        'firstName': 'Ayesha',
        'lastName': 'Saeed',
        'email': 'ayesha.saeed@gmail.com',
        'phone': '+1 6789012345',
        'experience': '5 Years',
        'gender': 'Female',
        'maritalStatus': 'Divorced',
        'qualification': 'MSc',
        'image': 'assets/images/Profile.png',
        'Status': 'Inactive',
        'dateOfJoining': '2018-05-20', // Add date of joining
      },
      {
        'id': '00011',
        'firstName': 'Azhan',
        'lastName': 'Saeed',
        'email': 'ayesha.saeed@gmail.com',
        'phone': '+1 6789012345',
        'experience': '5 Years',
        'gender': 'Female',
        'maritalStatus': 'Divorced',
        'qualification': 'MSc',
        'image': 'assets/images/Profile.png',
        'Status': 'Inactive',
        'dateOfJoining': '2018-05-20', // Add date of joining
      },
      {
        'id': '00012',
        'firstName': 'Akbar',
        'lastName': 'Saeed',
        'email': 'ayesha.saeed@gmail.com',
        'phone': '+1 6789012345',
        'experience': '5 Years',
        'gender': 'Female',
        'maritalStatus': 'Divorced',
        'qualification': 'MSc',
        'image': 'assets/images/Profile.png',
        'Status': 'Inactive',
        'dateOfJoining': '2018-05-20', // Add date of joining
      },

    ];
  }

  List<Map<String, String>> _filterData(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return _teacherData.where((teacher) {
      final fullName = '${teacher['firstName']} ${teacher['lastName']}'.toLowerCase();
      return fullName.contains(lowerCaseQuery) ||
          teacher['email']!.toLowerCase().contains(lowerCaseQuery) ||
          teacher['phone']!.toLowerCase().contains(lowerCaseQuery) ||
          teacher['qualification']!.toLowerCase().contains(lowerCaseQuery);
    }).toList();
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Teacher List'),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF9479F3),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset('assets/images/logo.png', width: 150),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFfdfdfd),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Teacher List',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '(Total: ${_filteredTeacherData.length})',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF9479F3),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildSearchForm(), // Keep the search form
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildTeacherCardList(),
          ],
        ),
      ),
    );
  }


  Widget _buildSearchForm() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return _teacherData
            .map((teacher) => '${teacher['firstName']} ${teacher['lastName']}')
            .where((teacherName) =>
            teacherName.toLowerCase().contains(textEditingValue.text.toLowerCase()))
            .toList();
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          controller: fieldTextEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: 'Search Teacher',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (query) {
            _searchController.text = query;
            setState(() {
              _filteredTeacherData = _filterData(query);
              _pagingController.refresh();
            });
          },
        );
      },
      onSelected: (String selection) {
        _searchController.text = selection;
        setState(() {
          _filteredTeacherData = _filterData(selection);
          _pagingController.refresh();
        });
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected,
          Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option),
                      tileColor: index.isEven
                          ? Colors.grey[200]
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      trailing: Icon(Icons.person, color: tropicalIndigo),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAdvancedSearchForm() {
    return Column(
      children: [
        // Search Text Field
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return _teacherData
                .map((teacher) => '${teacher['firstName']} ${teacher['lastName']}')
                .where((teacherName) =>
                teacherName.toLowerCase().contains(textEditingValue.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextField(
              controller: fieldTextEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: 'Search Teacher',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {
                _searchController.text = query;
                setState(() {
                  _filteredTeacherData = _filterData(query);
                  _pagingController.refresh();
                });
              },
            );
          },
          onSelected: (String selection) {
            _searchController.text = selection;
            setState(() {
              _filteredTeacherData = _filterData(selection);
              _pagingController.refresh();
            });
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          title: Text(option),
                          tileColor: index.isEven ? Colors.grey[200] : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          trailing: Icon(Icons.person, color: Colors.purpleAccent),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        // Gender Dropdown
      ],
    );
  }


  Widget _buildTeacherCardList() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFfdfdfd),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: PagedListView<int, Map<String, String>>(
        pagingController: _pagingController,
        shrinkWrap: true,
        builderDelegate: PagedChildBuilderDelegate<Map<String, String>>(
          itemBuilder: (context, teacher, index) => TeacherCard(
            teacher: teacher,
          ),
        ),
      ),
    );
  }
}
