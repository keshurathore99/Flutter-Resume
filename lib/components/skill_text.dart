import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SkillText extends pw.StatelessWidget {
  SkillText({required this.title});
  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Text(title,
        style: const pw.TextStyle(color: PdfColors.grey600, fontSize: 10));
  }
}
