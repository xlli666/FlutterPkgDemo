delayHandler(num milliseconds) {
  if (milliseconds == 0) {
    return Future.delayed(Duration.zero, () {});
  } else {
    return Future.delayed(Duration(milliseconds: milliseconds), () {});
  }
}