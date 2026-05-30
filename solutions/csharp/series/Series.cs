public static class Series
{
    public static string[] Slices(string numbers, int sliceLength)
    {
        if (sliceLength <= 0 || sliceLength > numbers.Length)
            throw new ArgumentException("");

        var slices = new string[numbers.Length - sliceLength + 1];

        for (int i = 0; i < slices.Length; i++)
            slices[i] = numbers.Substring(i, sliceLength);

        return slices;
    }
}