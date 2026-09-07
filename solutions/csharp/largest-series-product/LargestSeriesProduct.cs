public static class LargestSeriesProduct
{
    public static long GetLargestProduct(string digits, int span)
    {
        if (span < 0 || span > digits.Length)
            throw new ArgumentException("");

        var slices = new string[digits.Length - span + 1];

        for (int i = 0; i < slices.Length; i++)
            slices[i] = digits.Substring(i, span);

        var products = new long[slices.Length];

        for (int i = 0; i < slices.Length; i++)
        {
            products[i] = 1;
            foreach (char c in slices[i])
            {
                if (!char.IsDigit(c))
                    throw new ArgumentException("");
                products[i] *= c - '0';
            }
        }

        return products.Max();
    }
}