import 'package:flutter/material.dart';
import 'package:world_new_app/screens/article.dart';

class ArticleCard extends StatelessWidget {
  final title;
  final desc;
  final imageUrl;
  final url;
  ArticleCard({this.title, this.desc, this.imageUrl,this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleScreen(url)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(imageUrl)) ,
            SizedBox(height: 8.0,),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17.0),),
            ),
            SizedBox(height: 6.0,),

            Text(desc,style: TextStyle(color: Colors.black54,fontSize: 16.0),),
          ],
        ),
      ),
    );
  }
}
