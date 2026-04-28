using Microsoft.VisualBasic;

static class LogLine
{
    public static string Message(string logLine)
    {
        if (logLine[1] == 'I')
            return logLine[7..].Trim();
        else if (logLine[1] == 'W')
            return logLine[10..].Trim();
        else
            return logLine[8..].Trim();
    }

    public static string LogLevel(string logLine)
    {
        if (logLine[1] == 'I')
            return "info";
        else if (logLine[1] == 'W')
            return "warning";
        else
            return "error";
    }

    public static string Reformat(string logLine)
    {
        return Message(logLine) + " (" + LogLevel(logLine) + ")";
    }
}
