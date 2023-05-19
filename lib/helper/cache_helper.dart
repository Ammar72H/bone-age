import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static SharedPreferences? sharedPreferences ;

// object from SharedPreferences
  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

////////////// on boarding screen //////////////////

// write
  static Future<bool> writeFirstTime({required key , required value}) async {

    return await sharedPreferences!.setBool(key, value);
  }

// read
  static bool? readFirstTime({required key}){
    return sharedPreferences!.getBool(key)?? true;   // ?? Means >> if null
  }


///////// token

//  token
  // write
  static Future<bool> writeToken({required value}) async {

    return await sharedPreferences!.setString("token2", value);
  }

// read
  static String readToken(){
    return sharedPreferences!.getString("token2")??"";// ?? Means >> if null
  }

  // remove
  static Future<bool> removeToken() async{
    return await sharedPreferences!.remove("token2") ;
  }



//  Save int data
  // write
  static Future<bool> writeInt({required key ,required value}) async {

    return await sharedPreferences!.setInt(key, value);
  }

// read
  static dynamic readInt({required key}){
    return sharedPreferences!.getInt(key)?? 0;// ?? Means >> if null
  }

  // remove
  static Future<bool> removeInt({required key}) async{
    return await sharedPreferences!.remove(key) ;
  }


// sava String data

// write
static Future<bool> saveData({required key , required value}) async {

  return await sharedPreferences!.setString(key, value);
}

// read
static String getData({required key}) {
  return  sharedPreferences!.getString(key) ?? " ";
}


// remove
static Future<bool> removeData({required key})async{
  return await sharedPreferences!.remove(key) ;
}




}