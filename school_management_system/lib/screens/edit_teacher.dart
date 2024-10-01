import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_system/const/button.dart';

class EditTeacherPage extends StatefulWidget {
  final Map<String, String>? teacherData; // Data to pre-fill the form

  EditTeacherPage({Key? key, this.teacherData}) : super(key: key);

  @override
  _EditTeacherPageState createState() => _EditTeacherPageState();
}

class _EditTeacherPageState extends State<EditTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _dojController = TextEditingController();
  Uint8List? _selectedImage;

  @override
  void initState() {
    super.initState();
    if (widget.teacherData != null) {
      // Initialize the controllers with existing data
      _dobController.text = widget.teacherData!['dob'] ?? '';
      _dojController.text = widget.teacherData!['doj'] ?? '';
      // Optionally load the image if you have the image URL or byte data
    }
  }

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final Uint8List img = await pickedFile.readAsBytes();
      setState(() {
        _selectedImage = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Text('Edit Teacher'),
    ),
    foregroundColor: Colors.white,
    backgroundColor: tropicalIndigo,
    leading: IconButton(
    icon: Icon(
    Icons.menu,
    color: Colors.white,
    size: 30,
    ),
    onPressed: () {},
    ),
    actions: [
    Padding(
    padding: const EdgeInsets.only(right: 20),
    child: IconButton(
    icon: Icon(Icons.notifications),
    onPressed: () {},
    ),
    ),
    ],
    titleSpacing: 0,
    ),
    body: GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Image.asset(
    'assets/images/logo.png',
    width: 150,
    ),
    Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.topRight,
    children: [
    Container(
    width: 90,
    height: 90,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
    color: Color(0xFF9479F3),
    width: 2,
    ),
    image: _selectedImage != null
    ? DecorationImage(
    image: MemoryImage(_selectedImage!),
    fit: BoxFit.cover,
    )
        : null,
    ),
    child: _selectedImage == null
    ? Center(
    child: Text(
    'No Image',
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Colors.grey,
    ),
    ),
    )
        : null,
    ),
    Positioned(
    top: -10,
    right: -10,
    child: InkWell(
    onTap: selectImage,
    child: Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
    color: tropicalIndigo,
    shape: BoxShape.circle,
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 6,
    offset: Offset(2, 2),
    ),
    ],
    ),
    child: Icon(
    _selectedImage == null
    ? Icons.add_a_photo
        : Icons.change_circle,
    color: Colors.white,
    size: 20,
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    SizedBox(height: 20),

    Form(
    key: _formKey,
    child: Column(
    children: [
    Row(
    children: [
    Expanded(
    child: TextFormField(
    initialValue: widget.teacherData?['firstName'],
    decoration: InputDecoration(labelText: 'First Name'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter first name';
    }
    return null;
    },
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: TextFormField(
    initialValue: widget.teacherData?['lastName'],
    decoration: InputDecoration(labelText: 'Last Name'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter last name';
    }
    return null;
    },
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Expanded(
    child: DropdownButtonFormField<String>(
    value: widget.teacherData?['gender'],
    decoration: InputDecoration(labelText: 'Gender'),
    items: ['Male', 'Female', 'Other']
        .map((label) => DropdownMenuItem(
    child: Text(label),
    value: label,
    ))
        .toList(),
    onChanged: (value) {},
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: TextFormField(
    controller: _dobController,
    decoration: InputDecoration(labelText: 'Date of Birth'),
    readOnly: true,
    onTap: () async {
    DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
    setState(() {
    _dobController.text =
    "${pickedDate.toLocal()}".split(' ')[0];
    });
    }
    },
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Expanded(
    child: TextFormField(
    controller: _dojController,
    decoration: InputDecoration(labelText: 'Date of Joining'),
    readOnly: true,
    onTap: () async {
    DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
    setState(() {
    _dojController.text =
    "${pickedDate.toLocal()}".split(' ')[0];
    });
    }
    },
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: TextFormField(
    initialValue: widget.teacherData?['mobile'],
    decoration: InputDecoration(labelText: 'Mobile Number'),
    keyboardType: TextInputType.phone,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter mobile number';
    }
    return null;
    },
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Expanded(
    child: TextFormField(
    initialValue: widget.teacherData?['maritalStatus'],
    decoration: InputDecoration(labelText: 'Marital Status'),
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: TextFormField(
    initialValue: widget.teacherData?['status'],
    decoration: InputDecoration(labelText: 'Status'),
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    TextFormField(
    initialValue: widget.teacherData?['email'],
    decoration: InputDecoration(labelText: 'Email Address'),
    validator: (value) {
    if (value == null || !value.contains('@')) {
    return 'Please enter a valid email';
    }
    return null;
    },
    ),
    SizedBox(height: 10),
    TextFormField(
    initialValue: widget.teacherData?['password'],
    decoration: InputDecoration(labelText: 'Password'),
    obscureText: true,
    validator: (value) {
    if (value == null || value.length < 6) {
    return 'Password must be at least 6 characters long';
    }
    return null;
    },
    ),
    SizedBox(height: 5),
    TextFormField(
    initialValue: widget.teacherData?['currentAddress'],
    maxLines: 2,
    decoration: InputDecoration(labelText: 'Current Address'),
    ),
    SizedBox(height: 5),
    TextFormField(
    initialValue: widget.teacherData?['permanentAddress'],
      maxLines: 2,
      decoration: InputDecoration(labelText: 'Permanent Address'),
    ),
      SizedBox(height: 5),
      TextFormField(
        initialValue: widget.teacherData?['qualification'],
        maxLines: 2,
        decoration: InputDecoration(labelText: 'Qualification'),
      ),
      SizedBox(height: 5),
      TextFormField(
        initialValue: widget.teacherData?['workExperience'],
        maxLines: 2,
        decoration: InputDecoration(labelText: 'Work Experience'),
      ),
      SizedBox(height: 5),
      TextFormField(
        initialValue: widget.teacherData?['note'],
        maxLines: 2,
        decoration: InputDecoration(labelText: 'Note'),
      ),
      SizedBox(height: 20),
      CustomButton(
        text: 'Update',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Handle form submission and update logic
          }
        },
        isElevated: true,
      ),
    ],
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }
}
