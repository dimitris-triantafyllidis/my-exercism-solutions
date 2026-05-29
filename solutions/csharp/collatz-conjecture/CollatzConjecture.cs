public static class CollatzConjecture
{
    public static int Steps(int n)
    {
        ArgumentOutOfRangeException.ThrowIfNegativeOrZero(n);

        int s = 0;

        while (n > 1)
        {
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
            s += 1;
        }

        return s;
    }
}