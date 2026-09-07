using System.Text;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        StringBuilder lettersOnly = new();
        foreach(char c in input)
        {
            if(Char.IsLetter(c))
            {
                lettersOnly.Append(c);
            }
        }

        return lettersOnly.ToString().ToLower().Distinct().Count() == 26;
    }
}
