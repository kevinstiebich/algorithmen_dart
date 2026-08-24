void main(List<String> args) {
    String text = "Hallo";
    for (int i = 0; i < args.length; i++) {
        text += " ${args[i]}";
    }
    print("$text!");
}