void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  miniMaxSum(arr);
}

void miniMaxSum(List<int> arr) {
  int sumMin = 0;
  int sumMax = 0;

  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] > arr[j]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }

    if (i < arr.length - 1) {
      sumMin += arr[i];
    }

    if (i >= 1) {
      sumMax += arr[i];
    }
  }

  print("$sumMin $sumMax");
}
