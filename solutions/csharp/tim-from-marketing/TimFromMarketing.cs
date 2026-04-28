using System.ComponentModel;
using System.Reflection.Metadata.Ecma335;

static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        string badge = "";
        if (id != null)
        {
            badge += "[" + id + "] - ";
        }
        badge += name + " - ";
        badge += department?.ToUpper() ?? "OWNER";
        return badge;
    }
}
