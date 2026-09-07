public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var letters = word.ToLower().Where(Char.IsAsciiLetter);
        return letters.Count() == letters.ToHashSet().Count();
    }
}
