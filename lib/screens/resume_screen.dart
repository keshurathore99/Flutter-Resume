import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_in_flutter/components/skill_text.dart';

import '../components/block.dart';
import '../components/category.dart';
import '../components/percent.dart';
import '../components/url_text.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format, _) async {
  final doc = pw.Document(title: 'Keshav\'s Resume', author: 'Keshav Rathore');

  final profileImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/profile.jpg'))
          .buffer
          .asUint8List());

  doc.addPage(pw.MultiPage(
      build: (pw.Context context) => [
            pw.Partitions(children: [
              pw.Partition(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                    pw.Container(
                        padding: const pw.EdgeInsets.only(bottom: 20, left: 4),
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: <pw.Widget>[
                              pw.Text('Keshav Rathore',
                                  textScaleFactor: 2,
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold)),
                              pw.Padding(
                                  padding: const pw.EdgeInsets.only(top: 10)),
                              pw.Text('Flutter Developer',
                                  textScaleFactor: 1.2,
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold,
                                          color: green)),
                              pw.Padding(
                                  padding: const pw.EdgeInsets.only(top: 20)),
                              pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: <pw.Widget>[
                                          pw.Text('New Delhi,India'),
                                          pw.Text('India'),
                                        ]),
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: <pw.Widget>[
                                          pw.Text('9953106581'),
                                          UrlText('keshurathore99@gmail.com',
                                              'mailto:keshurathore99@gmail.com'),
                                          UrlText(
                                              'linkedin.com/in/keshav-rathore99',
                                              'www.linkedin.com/in/keshav-rathore99'),
                                        ]),
                                    pw.Padding(padding: pw.EdgeInsets.zero)
                                  ]),
                            ])),
                    Category(title: 'Education'),
                    Block(
                        title: 'Sarvodaya Kanya Vidyalaya, Delhi - 12th',
                        timeline: 'Mar 2016 - Mar 2017'),
                    pw.SizedBox(height: 4),
                    Block(
                        title:
                            'Guru Nanak Dev Institute of Technology, Delhi - Diploma',
                        timeline: 'Aug 2018 - Aug 2021'),
                    pw.SizedBox(height: 15),
                    Category(title: 'Work Experience'),
                    Block(
                        title:
                            'FINPLEX Solutions Pvt Ltd, Remote - Flutter Developer',
                        timeline: 'Aug 2020 - Nov 2020',
                        description:
                            'Worked as a Flutter Developer to develop Android Apps.'),
                    pw.SizedBox(height: 8),
                    Block(
                        title:
                            'Onelap Telematics Pvt Ltd, Delhi - Flutter Developer',
                        timeline: 'Nov 2020 - Present',
                        description:
                            'Working as a Flutter Developer to develop iOS (Onelap GPS Tracker App) and Web (CRM) App.'),
                    pw.SizedBox(height: 15),
                    Category(title: 'Projects'),
                    Block(
                        title: 'Onelap GPS Tracker App - iOS App',
                        description:
                            'This is the main app of Onelap Telematics Pvt Ltd for iOS. The frontend of the whole app is developed by me. This app is rich in features like Anti Theft Alerts,Safezones,Ignition Alerts,Track your vehicle etc. The app is published on the Apple Appstore.'),
                    pw.SizedBox(height: 6),
                    Block(
                        title: 'Onelap CRM - Web App',
                        description:
                            'This is the CRM of Onelap Telematics Pvt Ltd. It took more than a year to develop this CRM because of its complex features to manage customers relationships with the company. This CRM really helped to increase sales from 40% to 50%.'),
                  ])),
              pw.Partition(
                  width: sep,
                  child: pw.Column(children: [
                    pw.Container(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                          pw.ClipOval(
                              child: pw.Container(
                                  width: 100,
                                  height: 100,
                                  color: lightGreen,
                                  child: pw.Image(profileImage))),
                          pw.SizedBox(height: 24),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                Percent(
                                    size: 60,
                                    value: .90,
                                    title: pw.Text('Flutter')),
                                pw.SizedBox(height: 18),
                                Percent(
                                    size: 60,
                                    value: .85,
                                    title: pw.Text('Dart')),
                                pw.SizedBox(height: 18),
                                pw.Text('Skills'),
                                pw.SizedBox(height: 4),
                                SkillText(title: 'Flutter'),
                                SkillText(title: 'Dart'),
                                SkillText(title: 'Firebase'),
                                SkillText(title: 'Api Integration'),
                              ]),
                        ])),
                  ]))
            ])
          ]));
  return doc.save();
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PdfPreview(build: (format) => generateResume(format, null));
  }
}
