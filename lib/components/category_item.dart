import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:world_new_app/model/category_model.dart';


class CategoryItem extends StatelessWidget {
  CategoryModel category;
  Function function;

  CategoryItem(this.category,this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:function,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 60.0,
          width: 110.0,
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                height: 60.0,
                width: 110.0,
                fit: BoxFit.cover,
                imageUrl: category.imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: 60.0,
                width: 110.0,
                decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(8.0)),
                child: Text(category.title,textAlign: TextAlign.center ,style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.w500)))
          ],),
        ),
      ),
    );
  }
}


