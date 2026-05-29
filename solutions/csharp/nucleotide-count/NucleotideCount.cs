public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var counts = new Dictionary<char, int> {
            ['A'] = 0,
            ['C'] = 0,
            ['G'] = 0,
            ['T'] = 0
        };

        foreach (char c in sequence) {
            if (c is not ('A' or 'C' or 'G' or 'T'))
                throw new ArgumentException("");
            else
                counts[c]++;
        }

        return counts;
    }
}