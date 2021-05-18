import 'dart:io';
class Basic{
  var name;
  var age;
  static var common = 'common';
  // named constructor
  Basic.Basic(){
    print('constructor called');
    name = 'unknown';
    age = -1;
    common = 'changed';
  }
  Basic.parent(){
    print('constructor called from child');
  }
  Basic(var name,var age){
    print('constructor called');
    this.name = name;
    this.age =age;
  }
  @override
  String toString() {
    return 'name : $name\nage : $age\ncommon : $common';
  }
}
class Child extends Basic{
  @override
  var name = 'child';
  Child():super.parent(){
    print('child constructor called');
  }
}
void main(List<String> arguments){
  print('enter name');
  var name = stdin.readLineSync();
  stdout.write('enter age\n');
  var age  = int.parse(stdin.readLineSync());
  // var obj = Basic(name, age);
  // print(obj.toString());
  // modify(obj);
  // print('after modifying \n${obj.toString()}');
  // print(Basic.common);
  // var obj2 = Basic.Basic();
  // print(obj2);
  // print(Basic.common);
  var child = Child();
  print(child.name);
}
void modify(var obj){
  obj.name = 'modified';
  obj.age = -1;
}