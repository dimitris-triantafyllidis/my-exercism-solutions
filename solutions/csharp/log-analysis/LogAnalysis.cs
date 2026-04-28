public static class LogAnalysis
{
    public static string SubstringAfter(this string this_string, string delimiter)
    {
        var idx = this_string.IndexOf(delimiter);
        if (idx != -1)
        {
            return this_string[(idx + delimiter.Length)..];
        }
        else
        {
            return "";
        }
    }

    public static string SubstringBetween(this string this_string, string delimiter_left, string delimiter_right)
    {
        var idx_left = this_string.IndexOf(delimiter_left);
        var idx_right = this_string.IndexOf(delimiter_right);
        if (idx_left != -1 && idx_right != -1 && (idx_left <= idx_right))
        {
            return this_string[(idx_left + delimiter_left.Length)..idx_right];
        }
        else
        {
            return "";
        }
    }

    public static string Message(this string this_string)
    {
        return this_string.SubstringAfter(": ");
    }

    public static string LogLevel(this string this_string)
    {
        return this_string.SubstringBetween("[", "]");
    }
}