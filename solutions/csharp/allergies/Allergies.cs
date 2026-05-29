public enum Allergen
{
    Eggs         = 1,
    Peanuts      = 2,
    Shellfish    = 4,
    Strawberries = 8,
    Tomatoes    = 16,
    Chocolate   = 32,
    Pollen      = 64,
    Cats        = 128
}

public class Allergies
{
    public Allergies(int mask)
    {
        m_mask = mask;
    }

    public bool IsAllergicTo(Allergen allergen)
    {
        return (m_mask & ((int)allergen)) != 0;
    }

    public Allergen[] List()
    {
        var result = new List<Allergen>();

        foreach (Allergen a in Enum.GetValues<Allergen>())
        {
            if (IsAllergicTo(a))
                result.Add(a);
        }

        return [.. result];
    }

    private readonly int m_mask;
}