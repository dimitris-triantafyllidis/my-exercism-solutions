using System.Reflection.Metadata;

class WeighingMachine
{
    public WeighingMachine(int precision)
    {
        Precision = precision;
    }
    public int Precision { get; private set; }

    public double Weight
    {
        get
        {
            return mWeight;
        }
        set
        {
            if (value < 0)
            {
                throw new ArgumentOutOfRangeException();
            }
            else
            {
                mWeight = value;
            }
        }
    }
    private double mWeight;

    public double TareAdjustment { get; set;} = 5;

    public string DisplayWeight
    {
        get
        {
            return string.Format("{0:f" + Precision + "} kg", mWeight - TareAdjustment);
        }
    }
}
