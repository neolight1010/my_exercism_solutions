public class LogLevels {
    private static String openingLevelDelimiter = "[";
    private static String closingLevelDelimiter = "]: ";

    public static String message(String logLine) {
        int messageStartIndex = closingLevelDelimiterIndex(logLine) + closingLevelDelimiter.length();

        return logLine.substring(messageStartIndex).trim();
    }

    public static String logLevel(String logLine) {
        int levelStartIndex = openingLevelDelimiterIndex(logLine) + openingLevelDelimiter.length();

        String rawLevel = logLine.substring(levelStartIndex, closingLevelDelimiterIndex(logLine));

        return rawLevel.toLowerCase();
    }

    public static String reformat(String logLine) {
        return message(logLine) + " (" + logLevel(logLine) + ")";
    }

    private static int openingLevelDelimiterIndex(String logLine) {
        return logLine.indexOf(openingLevelDelimiter);
    }

    private static int closingLevelDelimiterIndex(String logLine) {
        return logLine.indexOf(closingLevelDelimiter);
    }
}
