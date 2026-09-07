using System.Globalization;

public static class HighSchoolSweethearts
{
    public static string DisplaySingleLine(string studentA, string studentB)
    {
        return studentA.PadLeft(29) + " ♡ " + studentB.PadRight(29);
    }

    public static string DisplayBanner(string studentA, string studentB)
    {
        return@$"     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     {studentA} +  {studentB}    **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *"
              ;
    }

    public static string DisplayGermanExchangeStudents(string studentA
        , string studentB, DateTime start, float hours)
    {
        return string.Format("{0} and {1} have been dating since {2} - that's {3} hours", studentA, studentB, start.ToString("d", new CultureInfo("de-DE")), hours.ToString("N2", new CultureInfo("de-DE")));
    }
}
