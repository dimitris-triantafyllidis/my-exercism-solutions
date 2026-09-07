using System.Linq.Expressions;

public static class CentralBank
{
    public static string DisplayDenomination(long @base, long multiplier)
    {
        long value;

        try
        {
            checked { value = @base * multiplier; }
        }
        catch (OverflowException)
        {
            return "*** Too Big ***";
        }

        return value.ToString();
    }

    public static string DisplayGDP(float @base, float multiplier)
    {
        float value = @base * multiplier;

        if (float.IsInfinity(value))
        {
            return "*** Too Big ***";
        }

        return value.ToString();
    }

    public static string DisplayChiefEconomistSalary(decimal salaryBase, decimal multiplier)
    {
        decimal value;

        try
        {
            value = salaryBase * multiplier;
        }
        catch (OverflowException)
        {
            return "*** Much Too Big ***";
        }

        return value.ToString();
    }
}
