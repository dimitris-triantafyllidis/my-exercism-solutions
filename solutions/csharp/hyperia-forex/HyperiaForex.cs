using System.Numerics;

public struct CurrencyAmount
{
    private decimal amount;
    private string currency;

    public CurrencyAmount(decimal amount, string currency)
    {
        this.amount = amount;
        this.currency = currency;
    }

    public static bool operator == (CurrencyAmount lhs, CurrencyAmount rhs)
    {
        if (lhs.currency != rhs.currency)
        {
            throw new ArgumentException();
        }
        return lhs.amount == rhs.amount;
    }

    public static bool operator != (CurrencyAmount lhs, CurrencyAmount rhs)
    {
        return !(lhs == rhs);
    }

    public static bool operator > (CurrencyAmount lhs, CurrencyAmount rhs)
    {
        if (lhs.currency != rhs.currency)
        {
            throw new ArgumentException();
        }
        return lhs.amount > rhs.amount;
    }

    public static bool operator < (CurrencyAmount lhs, CurrencyAmount rhs)
    {
        if (lhs.currency != rhs.currency)
        {
            throw new ArgumentException();
        }
        return lhs.amount < rhs.amount;
    }

    public static CurrencyAmount operator + (CurrencyAmount lhs, CurrencyAmount rhs)
    {
        if (lhs.currency != rhs.currency)
        {
            throw new ArgumentException();
        }
        return new CurrencyAmount(lhs.amount + rhs.amount, lhs.currency);
    }

    public static CurrencyAmount operator - (CurrencyAmount lhs, CurrencyAmount rhs)
    {
        if (lhs.currency != rhs.currency)
        {
            throw new ArgumentException();
        }
        return new CurrencyAmount(lhs.amount - rhs.amount, lhs.currency);
    }

    public static CurrencyAmount operator * (CurrencyAmount lhs, decimal rhs)
    {
        return new CurrencyAmount(lhs.amount * rhs, lhs.currency);
    }

    public static CurrencyAmount operator * (decimal lhs, CurrencyAmount rhs)
    {
        return rhs * lhs;
    }

    public static CurrencyAmount operator / (CurrencyAmount lhs, decimal rhs)
    {
        return new CurrencyAmount(lhs.amount / rhs, lhs.currency);
    }

    public static explicit operator double(CurrencyAmount arg)
    {
        return (double)(arg.amount);
    }

    public static implicit operator decimal(CurrencyAmount arg)
    {
        return (decimal)(arg.amount);
    }

}
