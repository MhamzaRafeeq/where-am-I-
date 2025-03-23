// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io' show Platform;
import 'dart:html' as html;

Future exportPDF(
  List<String>? listData1,
  List<String>? listData2,
  List<String>? listData3,
  List<String>? listData4,
  List<String>? listData5,
  List<String>? listData6,
  List<String>? listData7,
  List<String>? listData8,
  List<String>? listData9,
  List<String>? listData10,
  bool share,
  bool isweb,
  FFUploadedFile? image,
) async {
  // Add your function code here!

  final pdf = pw.Document();
  pdf.addPage(
    pw.MultiPage(
      build: (pw.Context context) {
        return [
          pw.Image(pw.MemoryImage(Uint8List.fromList(image!.bytes!))),
          //Rect.fromLTWH(0, 0, 500, 500),

          _buildSection(
            title: 'Convenience',
            listData1: listData1,
            listData2: listData2,
          ),
          _buildSection(
            listData1: listData3,
            listData2: listData4,
          ),
          _buildSection(
            title: 'Safety',
            listData1: listData5,
            listData2: listData6,
          ),
          _buildSection(
            listData1: listData7,
            listData2: listData8,
          ),
          _buildSection(
            title: 'Quality Of Life',
            listData1: listData9,
            listData2: listData10,
          ),
        ];
      },
    ),
  );
  if (share == true) {
    if (isweb) {
      // Web-specific sharing
      final bytes = await pdf.save();
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create an anchor element to trigger download
      //final anchor =
      html.AnchorElement(href: url)
        ..setAttribute('download', 'my-document.pdf')
        ..click();

      // Clean up
      html.Url.revokeObjectUrl(url);
    } else {
      // Mobile-specific sharing
      await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: 'savedReport.pdf',
      );
    }
  } else {
    // Layout PDF without sharing
    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }
}

pw.Widget _buildSection({
  String? title,
  List<String>? listData1,
  List<String>? listData2,
}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      if (title != null)
        pw.Text(
          title,
          style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
        ),
      pw.SizedBox(height: 20),
      if (listData1 != null && listData1.isNotEmpty)
        pw.ListView.builder(
          itemCount: listData1.length,
          itemBuilder: (pw.Context context, int index) {
            return pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(
                  width: 400,
                  child: pw.Text(
                    listData1[index],
                    style: pw.TextStyle(fontSize: 16),
                  ),
                ),
                pw.Text(
                  listData2 != null && index < listData2.length
                      ? listData2[index]
                      : '',
                  style: pw.TextStyle(fontSize: 16),
                ),
              ],
            );
          },
        ),
    ],
  );
}
