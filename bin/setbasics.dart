import 'dart:io';
void main(){
  print('Starting set...');
  var set = <int>{};
  for(var i = 0 ;i <10;i++){
    set.add(i);
  }
  set.add(-100);
  print(set);
  print('element at index 2 : ${set.elementAt(2)}');
  print('set size : ${set.length}');
  if(set.contains(5)){
    print('5 present in set');
  }else{
    print('value not present');
  }
  set.remove(5);
  print('set after removing 5 : ${set}');
  var list = set.toList(growable: true);
  print('list from set : $list');
  set.clear();
  print(set);
  print(list);
}