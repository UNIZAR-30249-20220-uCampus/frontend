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

  static String spaceNameParser(String input) {
    isNumeric(string) => num.tryParse(string) != null;
    input = input.trim();
    input = input.replaceAll("_", " ");
    input = input.replaceAll("\"", " ");
    input = input.toLowerCase();
    String output = "";
    for (int i = 0; i < input.length; i++) {
      if (i == 1 ||
          (i + 1 < input.length &&
              (input[i + 1] == '.' ||
                  input[i + 1] == "-" ||
                  isNumeric(input[i + 1])))) {
        output += input[i].toUpperCase();
      } else {
        output += input[i];
      }
    }
    return output;
  }
}
