import 'package:world_new_app/model/category_model.dart';

class Category {
List<CategoryModel> _list =[
CategoryModel('Business','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ83vgeeNXw9Ub3QuSsN3mzWcMEj2ZBViCPcA&usqp=CAU'),
 CategoryModel('Entertainment', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnjMsh0ip5aoJs73ApL6doD5DZFk4wdOCBtw&usqp=CAU'),
 CategoryModel('Sports', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ1y0zoLcBbmFqubPzzU2uTmJIAXZDjGcvHw&usqp=CAU'),
 CategoryModel('General', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU_wpst9LnZRTj03LlzqqD-SgMdAnY4SzOAg&usqp=CAU'),
 CategoryModel('Technology', 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80'),
 CategoryModel('Health', 'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80'),
 CategoryModel('Science', 'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80')
];

 List<CategoryModel> getCategory(){
  return _list;
}
}