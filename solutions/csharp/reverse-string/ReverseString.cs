public static class ReverseString
{
    public static string Reverse(string input)
    {
        string reversed = new("");
        for(int i = 0; i < input.Length; i++)
        {
           reversed = reversed.Insert(0, input[i].ToString());
        }
        return reversed;
    }
}