class StringUtils {
  static Map<int, String> _minuteStrings = {0: '00', 1: '30'};

  static String slotNumberToTimeString(int slotNumber) {
    String hours = ((slotNumber ~/ 2) % 24).toString().padLeft(2, '0');
    String minutes = _minuteStrings[slotNumber % 2];

    return hours + ':' + minutes;
  }

  static String slotLengthToString(int slotLength) {
    String minutes = _minuteStrings[slotLength % 2] + ' min';
    if (slotLength >= 2) {
      String hours = (slotLength ~/ 2).toString() + 'h';
      return hours + ' ' + minutes;
    } else {
      return minutes;
    }
  }
}
