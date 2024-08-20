import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/widgets/custom_button/custom_buton.dart';
import 'package:hangu_pesco_complaints_system/widgets/complaint_image_packer/complaint_image_packer.dart';

class TheftComplaint extends StatefulWidget {
  const TheftComplaint({Key? key}) : super(key: key);

  @override
  State<TheftComplaint> createState() => _TheftComplaintState();
}

class _TheftComplaintState extends State<TheftComplaint> {
  final TextEditingController _complainantNameController =
      TextEditingController();
  final TextEditingController _placeNameController = TextEditingController();
  final TextEditingController _complaintDetailsController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget _buildTextField(
      {String? hintText,
      TextEditingController? controller,
      int? maxLines = 1,
      TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          helperText: "",
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (hintText == 'Reference Number' && value.length != 14) {
            return 'Reference number should be 14 characters long';
          }
          if (hintText == 'MOBILE NO' && value.length != 11) {
            return 'Mobile number should be 11 characters long';
          }
          return null;
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form Submitted'),
          content:
              const Text('Your complaint has been submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Complaint Registration",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: mediaquery.height * .02),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('COMPLAINANT NAME',
                                style: Theme.of(context).textTheme.labelMedium),
                            const Expanded(child: SizedBox()),
                            Text('شکایت کنندہ کا نام',
                                style: Theme.of(context).textTheme.labelMedium)
                          ],
                        ),
                      ),
                      // 2nd textfield

                      // Complainant Name TextField
                      _buildTextField(
                        hintText: 'eg:(Muhammmad Saleem)',
                        controller: _complainantNameController,
                      ),
                      SizedBox(height: mediaquery.height * .02),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(' PLACE NAME',
                                style: Theme.of(context).textTheme.labelMedium),
                            const Expanded(child: SizedBox()),
                            Text(
                              'جگہ کا نام',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),

                      // Place Name TextField
                      _buildTextField(
                        hintText: 'Alshirawi Mohala',
                        controller: _placeNameController,
                      ),
                      SizedBox(height: mediaquery.height * .02),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'COMPLAINT DETIALS',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              'شکایت کی تفصیل',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),

                      //5th textfield
                      // Complaint Details TextField
                      _buildTextField(
                        hintText: 'COMPLAINT DETAILS',
                        controller: _complaintDetailsController,
                        maxLines: 5,
                      ),
                      SizedBox(height: mediaquery.height * .02),

// this is (text headings) for image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'SELECT AN IMAGE',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              'ایک تصویر منتخب کریں۔',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                      // paste image component here inside the singlechildscrollview
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          // height: 300,
                          height: mediaquery.height * .3,

                          child: const PickImage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomButton(
              onPressed: _submitForm,
              text: 'Submit',
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
