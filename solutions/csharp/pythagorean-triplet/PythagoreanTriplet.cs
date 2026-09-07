using System.Collections;

public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        var triplets = new List<(int a, int b, int c)>();
        for (int i = 0; i <= sum; i++)
        {
            for (int j = 0; j <= sum - i; j++)
            {
                int k = sum - i - j;
                if (i < j && j < k)
                {
                    if (i * i + j * j == k * k)
                    {
                        triplets.Add((i, j, k));
                    }
                }
            }
        }
        return triplets;
    }
}