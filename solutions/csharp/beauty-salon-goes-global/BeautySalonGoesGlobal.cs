using System.Globalization;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.CompilerServices;

public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc)
    {
        return dtUtc.ToLocalTime();
    }

    public static TimeZoneInfo GetTimeZoneInfoFromLocation(Location location)
    {
        string NewYorkTimeZoneId = "";
        string LondonTimeZoneId = "";
        string ParisTimeZoneId = "";

        if (OperatingSystem.IsWindows())
        {
            NewYorkTimeZoneId = "Eastern Standard Time";
            LondonTimeZoneId = "GMT Standard Time";
            ParisTimeZoneId = "W. Europe Standard Time";
        }
        else if (OperatingSystem.IsMacOS() || OperatingSystem.IsLinux())
        {
            NewYorkTimeZoneId = "America/New_York";
            LondonTimeZoneId = "Europe/London";
            ParisTimeZoneId = "Europe/Paris";
        }

        TimeZoneInfo localTimeZone =
            location switch
            {
                Location.NewYork => TimeZoneInfo.FindSystemTimeZoneById(NewYorkTimeZoneId),
                Location.London  => TimeZoneInfo.FindSystemTimeZoneById(LondonTimeZoneId),
                Location.Paris   => TimeZoneInfo.FindSystemTimeZoneById(ParisTimeZoneId),
                _ => throw new ArgumentOutOfRangeException(nameof(location))
            };

        return localTimeZone;
    }
    public static CultureInfo GetCultureForLocation(Location location)
    {
        return location switch
        {
            Location.NewYork => new CultureInfo("en-US"),
            Location.London  => new CultureInfo("en-GB"),
            Location.Paris   => new CultureInfo("fr-FR"),
            _ => CultureInfo.InvariantCulture
        };
    }

    public static DateTime Schedule(string appointmentDateDescription, Location location)
    {
        DateTime localDateTime = DateTime.Parse(appointmentDateDescription);

        var localTimeZone = GetTimeZoneInfoFromLocation(location);

        DateTime utcDateTime = TimeZoneInfo.ConvertTimeToUtc(localDateTime, localTimeZone);

        return utcDateTime;
    }

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel)
    {
        return alertLevel switch
        {
            AlertLevel.Early => appointment.AddDays(-1),
            AlertLevel.Standard => appointment.AddMinutes(-105),
            AlertLevel.Late => appointment.AddMinutes(-30),
            _ => throw new ArgumentOutOfRangeException(nameof(alertLevel))
        };
    }

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        var localTimeZone = GetTimeZoneInfoFromLocation(location);

        var offsetNow = localTimeZone.GetUtcOffset(dt);
        var offsetBefore = localTimeZone.GetUtcOffset(dt.AddDays(-7));

        return offsetNow != offsetBefore;
    }

    public static DateTime NormalizeDateTime(string dtStr, Location location)
    {
        var culture = GetCultureForLocation(location);

        if (!DateTime.TryParse(dtStr, culture, DateTimeStyles.None, out var localTime))
            return new DateTime(1, 1, 1);

        return DateTime.SpecifyKind(localTime, DateTimeKind.Unspecified);
    }
}
