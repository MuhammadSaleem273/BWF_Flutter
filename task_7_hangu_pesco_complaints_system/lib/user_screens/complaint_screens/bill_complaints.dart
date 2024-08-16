import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/components/uihelper.dart';
import 'package:hangu_pesco_complaints_system/components/complaint_image.dart';

class BillComplaint extends StatefulWidget {
  const BillComplaint({Key? key}) : super(key: key);

  @override
  State<BillComplaint> createState() => _BillComplaintState();
}

class _BillComplaintState extends State<BillComplaint> {
  final TextEditingController _referenceNumberController =
      TextEditingController();
  final TextEditingController _complainantNameController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
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
          // filled: true,
          // fillColor: Colors.black.withOpacity(0.1),
          hintText: hintText,
          border:OutlineInputBorder(),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Flexible(
                              child: Text(
                                "Please enter fourteen digit correctreference no printed on the electricity bill.Thank You! ",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '  بجلی کےبل پردرج چودہ ہندسوں پرمشتمل درست حوالہ نمبر درج کیجیے۔شکریہ',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                      //  1st textfield
                      // Reference Number TextField
                      _buildTextField(
                        hintText: 'Reference Number',
                        controller: _referenceNumberController,
                        keyboardType: TextInputType.number,
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
                              'COMPLAINANT NAME',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              'شکایت کنندہ کا نام',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
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

                      //3rd textfield

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
                              'MOBILE NO',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              'موبائل فون کانمبر',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                      // Mobile Number TextField
                      _buildTextField(
                        hintText: 'eg:03341965302',
                        controller: _mobileNumberController,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: mediaquery.height * .02),

                      //4th
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
                              ' PLACE NAME',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
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
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: UiHelper.customButton(_submitForm, 'Submit'),
                // UiHelper.customButton(() {
                //   _submitForm;
                // }, 'Submit'),
              ),
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
