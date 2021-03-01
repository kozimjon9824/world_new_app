
import 'package:flutter/material.dart';
import 'package:world_new_app/components/article_card.dart';
import 'package:world_new_app/components/category_item.dart';
import 'package:world_new_app/components/loading.dart';
import 'package:world_new_app/model/article_model.dart';
import 'package:world_new_app/model/category_data.dart';
import 'package:world_new_app/model/category_model.dart';
import 'package:world_new_app/model/network/news.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category categories;
  List<CategoryModel> categoryList=[];
  List<ArticleModel> articles=[];
  bool isLoading=false;
  String positionedTitle;

  @override
  void initState() {
    super.initState();
    categories=Category();
    categoryList.addAll(categories.getCategory());
    getNews();
  }

  getNews() async{
    NetWorkHelper netWorkHelper=NetWorkHelper();
    isLoading=true;
    String url='https://newsapi.org/v2/top-headlines?country=us&apiKey=90c40f4307474c74bfabf5d685e10dc6';
    await netWorkHelper.getNews(url);
    articles.addAll(netWorkHelper.news);
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        title: RichText(text: TextSpan(
          children: [
            TextSpan(text: 'ABC',style: TextStyle(color: Colors.red,fontSize: 18.0,fontWeight: FontWeight.w500)),
            TextSpan(text: 'News',style: TextStyle(color: Colors.blue,fontSize: 18.0,fontWeight: FontWeight.w500)),
          ]
        )),
      ),

      body: isLoading?Loading(): Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [

          Container(
            height: 60,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
                itemBuilder:(context,index){
                  return CategoryItem(categoryList[index],positionedTitle!=categoryList[index].title? ()async {
                    positionedTitle=categoryList[index].title;
                    NetWorkHelper netWorkHelper=NetWorkHelper();
                   setState(() {
                     isLoading=true;
                   });
                    String url='https://newsapi.org/v2/top-headlines?country=us&category=${categoryList[index].title.toLowerCase()}&apiKey=90c40f4307474c74bfabf5d685e10dc6';
                    await netWorkHelper.getNews(url);
                    articles.clear();
                    articles.addAll(netWorkHelper.news);
                    setState(() {
                      isLoading=false;
                    });

                  }:(){}
                  );
                } ),
          ),

          //mainArticles

          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: articles.length,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return ArticleCard(
                        title:articles[index].title,
                        desc:articles[index].description,
                        imageUrl:articles[index].urlToImage,
                    url: articles[index].url);
                  }),
            ),
          )
        ],),
      ),
    );
  }
}


