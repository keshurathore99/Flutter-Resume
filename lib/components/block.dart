import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../screens/resume_screen.dart';

class Block extends pw.StatelessWidget {
  Block({required this.title, this.timeline, this.description});

  final String title;
  final String? timeline;
  final String? description;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                    width: 6,
                    height: 6,
                    margin: const pw.EdgeInsets.only(
                        left: 2, top: 3.5, bottom: 2, right: 5),
                    decoration: const pw.BoxDecoration(
                        color: green, shape: pw.BoxShape.circle)),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.normal)),
              ]),
          pw.SizedBox(height: 2),
          pw.Container(
              decoration: const pw.BoxDecoration(
                  border:
                      pw.Border(left: pw.BorderSide(color: green, width: 2))),
              padding: const pw.EdgeInsets.only(left: 10),
              margin: const pw.EdgeInsets.only(left: 5),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    if (timeline != null)
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(timeline!,
                                style: const pw.TextStyle(
                                    fontSize: 10, color: PdfColors.grey600)),
                            pw.SizedBox(height: 1),
                          ]),
                    if (description != null)
                      pw.Text(description!,
                          style: const pw.TextStyle(
                              color: PdfColors.grey600, fontSize: 10)),
                  ])),
        ]);
  }
}
