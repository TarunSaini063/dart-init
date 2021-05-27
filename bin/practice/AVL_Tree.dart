import 'dart:io';

import 'dart:math';

class Tree {
  var value, height = 0;
  Tree left, right;
  Tree({this.value, this.left, this.right});
}
int ht({Tree node}){
  if(node == null) return 0;
  return node.height;
}

int balance({Tree node}){
  if(node == null ) return 0;
  return ht(node : node.left) - ht(node: node.right);
}

void rightRotate({Tree node}){
  var lr = node.left;
  node.left = lr.right;
  lr.right = node;
  // lr.height = max(ht(node: node),ht())
}

Tree insert({Tree root, int val}) {
  if (root == null) {
    return Tree(value: val);
  }
  if (root.value > val) {
    root.right = insert(root: root.right, val: val);
  } else if (root.value < val) {
    root.left = insert(root: root.left, val: val);
  } else {
    return root;
  }

  root.height = 1 + max(ht(node : root.left), ht(node : root.right));

  int bal = balance(node : root);

  if(bal > 1){

  }
}

void main(List<String> args) {
  var n = int.parse(stdin.readLineSync());
  var arr = [];
  for (var i = 0; i < n; i++) {
    arr.add(int.parse(stdin.readLineSync()));
  }
  Tree root;
  arr.forEach((element) {
    root = insert(root: root, val: element);
  });
}
