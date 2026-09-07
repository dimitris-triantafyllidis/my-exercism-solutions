class RemoteControlCar
{
    private int battery_percent = 100;
    private int distance_driven = 0;
    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return "Driven " + distance_driven + " meters";
    }

    public string BatteryDisplay()
    {
        if (battery_percent > 0)
        {
            return "Battery at " + battery_percent + "%";
        }
        else
        {
            return "Battery empty";
        }
    }

    public void Drive()
    {
        if(battery_percent > 0)
        {
            distance_driven += 20;
            battery_percent -= 1;
        }
    }
}
