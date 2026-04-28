using System.Runtime.InteropServices;
using System.Text;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        StringBuilder clean = new();

        for (int i = 0; i < identifier.Length; i++)
        {
            if(identifier[i] == ' ')
            {
                clean.Append('_');
            }
            else if(identifier[i] == '-')
            {
                i++;
                clean.Append(identifier[i].ToString().ToUpper());
            }
            else if(Char.IsControl(identifier[i]))
            {
                clean.Append("CTRL");
            }
            else if(!Char.IsLetter(identifier[i]))
            {
                continue;
            }
            else if(Char.IsBetween(identifier[i], 'α', 'ω'))
            {
                continue;
            }
            else
            {
                clean.Append(identifier[i]);
            }
        }
        return clean.ToString();
    }
}
