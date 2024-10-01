import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:school_management_system/const/button.dart';
import 'package:school_management_system/const/cards.dart'; // Import the StudentCard
import 'package:school_management_system/const/navbar.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  static const _pageSize = 3;
  final PagingController<int, Map<String, String>> _pagingController = PagingController(firstPageKey: 0);

  List<Map<String, String>> _studentData = [];
  List<Map<String, String>> _filteredStudentData = [];

  // Controllers for search inputs
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _pagingController.addPageRequestListener((pageKey) {
      _loadPage(pageKey);
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
      _studentData = _getStudentData(); // Load student data
      _filteredStudentData = _studentData; // Initialize filtered data
    });
  }

  Future<void> _loadPage(int pageKey) async {
    try {
      setState(() {
        // Show a loading indicator if necessary
      });

      await Future.delayed(const Duration(milliseconds: 1000));
      final isLastPage = pageKey + _pageSize >= _filteredStudentData.length;
      final newItems = _filteredStudentData.skip(pageKey).take(_pageSize).toList();

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    } finally {
      setState(() {
        // Hide the loading indicator
      });
    }
  }

  List<Map<String, String>> _getStudentData() {
    return [
      // Sample data
      {
        'id': '00001',
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john.doe@gmail.com',
        'phone': '+1 0123456789',
        'gender': 'Male',
        'status': 'Active',
        'image': 'assets/images/Profile.png',
        'religion': 'Islam',
      },
      // More student data...
    ];
  }

  List<Map<String, String>> _filterData(String query) {
    return _studentData.where((student) {
      String fullName = '${student['firstName']} ${student['lastName']}'.toLowerCase();
      return fullName.contains(query) ||
          student['email']!.toLowerCase().contains(query) ||
          student['phone']!.toLowerCase().contains(query) ||
          student['gender']!.toLowerCase().contains(query) ||
          student['status']!.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Student List'),
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildStudentCardList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Student List'),
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
                    child: _buildSearchForm(), // Add the search form here
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildStudentCardList(),
          ],
        ),
      ),
    );
  }


  Widget _buildStudentCardList() {
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
          itemBuilder: (context, student, index) => StudentCard(
            studentData: student,
          ),
        ),
      ),
    );
  }
}
