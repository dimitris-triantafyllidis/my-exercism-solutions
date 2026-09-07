using System.Text.RegularExpressions;

public static class Bob
{
    public static string Response(string statement)
    {
        statement = statement.Trim();
        var isSilence       = statement == "";
        var isQuestion      = statement.EndsWith('?') && !statement.StartsWith('?');

        var containsLetters = Regex.IsMatch(statement, "[A-Za-z]");

        var isYelling = containsLetters && statement.ToUpper().Equals(statement);

        if      ( isSilence               ) { return "Fine. Be that way!";                }
        else if ( isQuestion && isYelling ) { return "Calm down, I know what I'm doing!"; }
        else if ( isQuestion              ) { return "Sure.";                             }
        else if ( isYelling               ) { return "Whoa, chill out!";                  }
        else                                { return "Whatever.";                         }
    }
}