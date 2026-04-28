using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using Microsoft.VisualBasic;

class Lasagna
{
    public int ExpectedMinutesInOven()
    {
        return 40;
    }

    public int RemainingMinutesInOven(int minutes_in_oven_elapsed)
    {
        return ExpectedMinutesInOven() - minutes_in_oven_elapsed;
    }
    public int PreparationTimeInMinutes(int layer_count)
    {
        return 2 * layer_count;
    }
    public int ElapsedTimeInMinutes(int layer_count, int minutes_in_oven_elapsed)
    {
        return PreparationTimeInMinutes(layer_count) + minutes_in_oven_elapsed;
    }
}
