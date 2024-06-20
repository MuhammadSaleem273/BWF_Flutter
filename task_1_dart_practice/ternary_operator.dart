void main()
 {
  int number = -5; 

  String result = (number > 0) ? '$number is positive.'
                : (number < 0) ? '$number is negative.'
                : '$number is zero.';

  print(result);
}
