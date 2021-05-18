import 'dart:io';
void main(List<String> arguments){
  var x = int.parse(stdin.readLineSync());
  assert(x>0,'only positive values are accepted');
  switch(x){
   case 1 : print('one');
        break;
    case 2 : print('two');
        break;
    default: print('default');
  }
}