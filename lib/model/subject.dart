import 'package:cikguu_app/controller/browseResult.dart';
import 'package:flutter/material.dart';

class GridLayout {
  final String eng;
  final String malay;

  GridLayout(this.eng, this.malay);
}

// List<GridLayout> options = [
//   GridLayout('Malay', 'Bahasa Melayu'),
//   GridLayout('English', 'Bahasa Inggeris'),
//   GridLayout('Science', 'Sains'),
//   GridLayout('Mathematics', 'Matematik'),
//   GridLayout('History', 'Sejarah'),
//   GridLayout('Moral Education', 'Pendidikan Moral'),
//   GridLayout('Islamic Education', 'Pendidikan Islam'),
//   GridLayout('Add. Mathematics', 'Matematik Tambahan'),
//   GridLayout('Chemistry', 'Kimia'),
//   GridLayout('Biology', 'Biologi'),
//   GridLayout('Physics', 'Fizik'),
//   GridLayout('Economics', 'Ekonomi'),
// ];

class GridOptions extends StatelessWidget {
  final GridLayout layout;
  GridOptions({this.layout});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BrowseResult(exam: 'spm', subject: layout.eng.toLowerCase()),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                layout.eng,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                layout.malay,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                //size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
