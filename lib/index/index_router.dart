
import 'package:fluro/fluro.dart';
import 'package:task/index/page/login/login_page.dart';
import 'package:task/index/page/main/main_page.dart';
import 'package:task/index/page/web/web_page.dart';
import 'package:task/routers/router_init.dart';





class IndexRouter implements IRouterProvider{

  static String indexPage = "/index";
  static String englishPage = "/english";
  static String inPage = "/in";
  static String todoPage = "/todo";
  static String taskPage = "/task";
  static String infoPage = "/info/";
  static String searchTaskPage = "/task/search";
  static String suitcasePage = "/suitcase";
  static String artPage = "/art";
  static String sPage = "/s";
  static String loginPage = "/login";
  static String mainPage = "/main";
  static String webPage = "/web";

  
  @override
  void initRouter(Router router) {
    router.define(mainPage, handler: Handler(handlerFunc: (_, params) => MainPage()));
    router.define(webPage, handler: Handler(handlerFunc: (_, params) => WebPage()));
    router.define(loginPage, handler: Handler(handlerFunc: (_, params) => LoginPage()));
  }
  
}