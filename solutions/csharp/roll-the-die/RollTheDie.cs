
public class Player
{
    public static Random prng = new();
    public int RollDie()
    {
        return prng.Next(1, 19);
    }

    public double GenerateSpellStrength()
    {
        return prng.NextDouble() * 100;
    }
}
