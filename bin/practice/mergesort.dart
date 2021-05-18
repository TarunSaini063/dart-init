import 'dart:io';
void main(List<String> arguments){
  var n = int.parse(stdin.readLineSync());
  var arr = [];
  for(var i = 0; i<n; i++){
    arr.add(int.parse(stdin.readLineSync()));
  }
  mergeSort(arr,0,n-1);
  print('sorted List : $arr');
}
void mergeSort(var list,var start,var end){
  if(start<end){
    var mid = (start+end)~/2;
    mergeSort(list, start, mid);
    mergeSort(list, mid+1, end);
    list = merge(list,start,mid,end);
  }
}
 List<dynamic> merge(var list,var start,var mid,var end){
  var l = mid - start +1;
  var r = end - mid;
  var L = [];
  var R = [];
  for(var i = 0; i<l; i++){
    L.add(list[start+i]);
  }
  for(var i = 0; i<r; i++){
    R.add(list[mid+i+1]);
  }
  var i = 0, j = 0;
  while(i<l && j<r){
    if(L[i]<R[j]){
      list[start++] = L[i++];
    }else {
      list[start++] = R[j++];
    }
  }
  while(i<l){
    list[start++] = L[i++];
  }
  while(j<r){
    list[start++] = R[j++];
  }
  return list;
}