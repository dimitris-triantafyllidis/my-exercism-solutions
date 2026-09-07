public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int n)
    {
        var digits = n.ToString();

        int s = 0;

        foreach (char c in digits)
        {
            s += (int)Math.Pow(c - '0', digits.Length);
        }

        return s == n;

    }
}