public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static int AliquotSum(int n)
    {
        if (n < 1) {
            throw new ArgumentOutOfRangeException("");
        }

        int sum = 0;

        for (int i = 1; i <= n-1; i++) {
            sum += n % i == 0 ? i : 0;
        }

        return sum;
    }

    public static Classification Classify(int n)
    {
        if (n == AliquotSum(n)) {
            return Classification.Perfect;
        }
        else if (n < AliquotSum(n)) {
            return Classification.Abundant;
        }
        else {
            return Classification.Deficient;
        }
    }
}
