class RemoteControlCar
{
    public RemoteControlCar(int speed, int batteryDrain)
    {
        mSpeed = speed;
        mBatteryDrain = batteryDrain;
    }

    public bool BatteryDrained()
    {
        return mBatteryPercentage < mBatteryDrain;
    }

    public int DistanceDriven()
    {
        return mDistanceDriven;
    }

    public void Drive()
    {
        if (!BatteryDrained())
        {
            mBatteryPercentage -= mBatteryDrain;
            mDistanceDriven += mSpeed;
        }
    }

    public static RemoteControlCar Nitro()
    {
        return new RemoteControlCar(50, 4);
    }

    private readonly int mSpeed;
    private readonly int mBatteryDrain;

    private int mDistanceDriven;
    private int mBatteryPercentage = 100;
}

class RaceTrack
{
    public RaceTrack(int distance)
    {
        mDistance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (!car.BatteryDrained())
        {
            car.Drive();
            if(car.DistanceDriven() >= mDistance)
            {
                return true;
            }
        }
        return false;
    }

    private readonly int mDistance;
}
