import 'dart:io';

import 'dart:math';

var n;
var arr = [];
var tree = List<int>.filled(4 * n + 10, 0);

void build(int l, int r, int node) {
  if (l == r) {
    tree[node] = arr[l];
  } else {
    var mid = (l + r) ~/ 2;
    build(l, mid, 2 * node + 1);
    build(mid + 1, r, 2 * node + 2);
    tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
  }
}

int sum(int node, int l, int r, int cl, int cr) {
  if (l > r) return 0;
  if (l == cl && r == cr) {
    return tree[node];
  } else {
    var mid = (cl + cr) ~/ 2;
    return sum(2 * node + 1, l, min(r, mid), cl, mid) +
        sum(2 * node + 2, max(mid + 1, l), r, mid + 1, cr);
  }
}

void update(int idx, int node, int l, int r, int val) {
  if (l == r) {
    arr[idx] = val;
    tree[node] = val;
  } else {
    var mid = (l + r) ~/ 2;
    if (idx <= mid) {
      update(idx, 2 * node + 1, l, mid, val);
    } else {
      update(idx, 2 * node + 2, mid + 1, r, val);
    }
    tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
  }
}

void main(List<String> arguments) async {
  n = int.parse(stdin.readLineSync());
  for (var i = 0; i < n; i++) {
    arr.add(int.parse(stdin.readLineSync()));
  }
  build(0, n - 1, 0);
  var q = int.parse(stdin.readLineSync());
  while (q-- > 0) {
    var type = int.parse(stdin.readLineSync());
    var l = int.parse(stdin.readLineSync());
    var r = int.parse(stdin.readLineSync());
    if (type == 0) {
      print(sum(0, l, r, 0, n - 1).toString());
    } else {
      update(l, 0, 0, n - 1, r);
    }
  }
}
