import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/controller/documents_controller.dart';
import 'package:restaurant/views/pages/document/add_document.dart';
import 'package:restaurant/views/pages/document/documents_detail.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key key}) : super(key: key);

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  DocumentsController documentsController = Get.put(DocumentsController());
  int status = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DocumentsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              elevation: 2,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_outlined),
                color: Colors.black,
              ),
              title: Text(
                "Documents",
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 1),
                )),
                textAlign: TextAlign.center,
              )),
          body:  documentsController.isLoading == true
                        ? const Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Center(
                                child: SpinKitFadingFour(
                              color: Colors.black,
                              size: 40,
                            )))
                        : 
                        Container(
                          child:    documentsController.allDocumentModel.data.isEmpty
              ? Center(
                  child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "+ Add Document",
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Get.to(const AddDocuments(),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.leftToRight,
                        curve: Curves.easeInOut);
                  },
                ))
              : 
              // GetBuilder(
              //     init: DocumentsController(),
              //     builder: (controller) {
              //       return
                    Padding(
                            padding: EdgeInsets.only(top:20,right: 20,left: 20,bottom: 70),
          
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: (2 / 3),
                                ),
                                itemCount: documentsController
                                    .allDocumentModel.data.length,
                                itemBuilder: (context, index) {
                                  final doc = documentsController
                                      .allDocumentModel.data[index];
                                  return 
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          documentsController.setLoading(true);
                                       
                                          documentsController.setDocName(doc.documentName);
                                          documentsController.setfrontImage(doc.imageUrlFront);
                                          documentsController.setbackImage(doc.imageUrlBack);
                                          documentsController.setIssue(doc.issueDate.toString());
                                          documentsController.setExpiry(doc.expiryDate.toString());

                                       Get.to(() => DocumentDetail(),
                                              duration:
                                                  const Duration(milliseconds: 500),
                                              transition: Transition.leftToRight,
                                              curve: Curves.easeInOut);

                                              documentsController.setLoading(false);
                                          

                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              border: Border.all(
                                                  color: Colors.black12, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          // height: 190,
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  3.9,
                                          width: MediaQuery.of(context).size.width *
                                              1.2,

                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.copy_outlined,
                                                color: Colors.black54,
                                                size: 50,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                doc.documentName,
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                )),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "${doc.documentStatusName}",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black54,
                                                )),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //  color: Colors.amber,
                                        width:
                                            MediaQuery.of(context).size.width * 1.2,
                                        height:
                                            MediaQuery.of(context).size.height / 25,

                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Expiry",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black54,
                                                )),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${getFormattedDate(doc.expiryDate.toString())}',
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black54,
                                                )),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ),
          
       
                  //}),
          floatingActionButton: 
          documentsController.isLoading == true?null:
          documentsController.allDocumentModel.data.isEmpty
              ? null
              : FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.to(const AddDocuments(),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.leftToRight,
                        curve: Curves.easeInOut);
                  },
                ),
        );
      }
    );
  }

  String getFormattedDate(String date) {
    // Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(localDate.toString());

    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
