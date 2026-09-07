public interface IRemoteControlCar : IComparable<IRemoteControlCar>
{
    public int DistanceTravelled { get; set; }
    public int NumberOfVictories { get; set; }

    public void Drive ();
}

public class ProductionRemoteControlCar : IRemoteControlCar
{
    public int DistanceTravelled { get; set; }
    public int NumberOfVictories { get; set; }

    public int CompareTo(IRemoteControlCar? other)
    {
        if (other == null)
        {
            throw new NullReferenceException();
        }
        if (NumberOfVictories < other.NumberOfVictories)
        {
            return -1;
        }
        else if (NumberOfVictories > other.NumberOfVictories)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    public void Drive()
    {
        DistanceTravelled += 10;
    }
}

public class ExperimentalRemoteControlCar : IRemoteControlCar
{
    public int DistanceTravelled { get; set; }
    public int NumberOfVictories { get; set; }
    public int CompareTo(IRemoteControlCar? other)
    {
        if (other == null)
        {
            throw new NullReferenceException();
        }
        if (NumberOfVictories < other.NumberOfVictories)
        {
            return -1;
        }
        else if (NumberOfVictories > other.NumberOfVictories)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    public void Drive()
    {
        DistanceTravelled += 20;
    }
}

public static class TestTrack
{
    public static void Race(IRemoteControlCar car)
    {
        car.Drive();
    }

    public static List<ProductionRemoteControlCar> GetRankedCars(ProductionRemoteControlCar prc1,
        ProductionRemoteControlCar prc2)
    {
        List<ProductionRemoteControlCar> ranked = new();

        ranked = ranked.Append(prc1).ToList();
        ranked = ranked.Append(prc2).ToList();
        ranked.Sort();

        return ranked;
    }
}
