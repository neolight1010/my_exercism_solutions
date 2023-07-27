using System.Text.RegularExpressions;

static class LogLine
{
    static private Regex LOG_LINE_REGEX =
        new Regex(@"\[(?<level>.*)\]: (?<message>.*)");

    public static string Message(string logLine) =>
        LOG_LINE_REGEX.Match(logLine).Groups["message"].Value.Trim();

    public static string LogLevel(string logLine) =>
        LOG_LINE_REGEX.Match(logLine).Groups["level"].Value.ToLower();

    public static string Reformat(string logLine) =>
        $"{Message(logLine)} ({LogLevel(logLine)})";
}
