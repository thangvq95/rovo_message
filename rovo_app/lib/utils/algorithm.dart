class Algorithm {

  static List<String> conductSession1_2(int x) {
    List<String> result = [];
    _compositions([], x, 0, result);
    return result;
  }

  static void _compositions(List<int> list, int n, int i, List<String> result)
  {
    if (n == 0) {
      result.add(_array(list, i));
    }
    else if(n > 0) {
      for (int j = 1; j <= 2; j++)
      {
        list.insert(i, j);
        _compositions(list, n-j, i+1, result);
      }
    }
  }

  static String _array(List<int> arr, int size)
  {
    String temp = '';
      for (int i = 0; i < size; i++)
        temp += arr[i].toString()+'  ';
     return temp;
  }

}