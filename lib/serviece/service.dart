 
 import 'package:dio/dio.dart' ;

 class SocialService {
  Dio dio=Dio();
  Future <void> register( String email, String password,String username)async{

  Response <dynamic> responce = await dio.post('http://socialmedia-api-v1.onrender.com/auth/register',
  data: { 
    'email': email,
    'password': password,
    'username': username,
  },
  options: Options(
    headers: {'Content - type':'application/json'} ));
    return null;

   
 
  }
  
} 

// class TodoService {
  

//   Future <List<Item>> fetchData()async{
//     final url ="https://api.nstack.in/v1/todos?page=1&limit=10";
//     final uri=  Uri.parse(url);
//      final  data =await http.get(uri);
//      if (data.statusCode==200) {
//        final store=jsonDecode(data.body);
      
//        final result=TodooModels.fromJson(store);
//        return result.items;

//      } else{
//       throw Exception('failed');
//      }
//   }
//   Future<void>addDataaaa(Item requestmodel)async{ 
  
//   final url='https://api.nstack.in/v1/todos';
//    final uri=  Uri.parse(url);
//    final data = await http.post(uri,body: jsonEncode(requestmodel),
//    headers:{'Content-Type': 'application/json'});
//    if (data.statusCode==201) {
//      print('creation success');
//    }else{
//     print('not success');
//    }
//   }
//   Future <void>delete(String id)async{
//     final url = 'https://api.nstack.in/v1/todos/${id}';
//     final uri =Uri.parse(url);
//     final responce=await http.delete(uri);
//     if (responce.statusCode==200) {
//       throw Exception('deleted');
//     }else{
//       throw Exception('not working');
//     }
//   }
//   Future <void> edit (Item requestmodel,String id)async{
// final url = 'https://api.nstack.in/v1/todos/$id';
// final uri = Uri.parse(url);
// final responce =await http.put(uri,body:jsonEncode(requestmodel),
// headers: {'Content-Type': 'application/json'} ); 
// if (responce.statusCode==200) {
//   print("Success");
// }else{
//     print("faild");
// }
//   }
  
