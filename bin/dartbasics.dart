import 'dart:io';
void main(List<String> arguments) {
  var list = List<int>.filled(12,-1,growable: true);
  for(var i = 0; i<12; i++){
    list[i] = -i+1;
  }
  print(list.toString());
  list.forEach((element) {element = -1;});
  print(list);
}
