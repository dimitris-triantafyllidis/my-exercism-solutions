using System.Security;

public class FacialFeatures
{
    public string EyeColor { get; }
    public decimal PhiltrumWidth { get; }

    public FacialFeatures(string eyeColor, decimal philtrumWidth)
    {
        EyeColor = eyeColor;
        PhiltrumWidth = philtrumWidth;
    }

    public override int GetHashCode()
    {
        return EyeColor.GetHashCode() + PhiltrumWidth.GetHashCode();
    }

    public bool Equals(FacialFeatures other)
    {
        return EyeColor.Equals(other.EyeColor) && PhiltrumWidth == other.PhiltrumWidth;
    }
}

public class Identity
{
    public string Email { get; }
    public FacialFeatures FacialFeatures { get; }

    public Identity(string email, FacialFeatures facialFeatures)
    {
        Email = email;
        FacialFeatures = facialFeatures;
    }

    public override int GetHashCode()
    {
        return Email.GetHashCode() + FacialFeatures.GetHashCode();
    }

    public bool Equals(Identity other)
    {
        return FacialFeatures.Equals(other.FacialFeatures) && Email.Equals(other.Email);
    }

}

public class Authenticator
{
    public static bool AreSameFace(FacialFeatures faceA, FacialFeatures faceB)
    {
        return faceA.Equals(faceB);
    }

    public bool IsAdmin(Identity identity)
    {
        return identity.Equals (
            new Identity (
                "admin@exerc.ism",
                new FacialFeatures (
                    "green",
                    0.9m
                )
            )
        );
    }

    public bool Register(Identity identity)
    {
        if (!IsRegistered(identity))
        {
            mIdentities = [.. mIdentities, identity];
            return true;
        }
        return false;
    }

    public bool IsRegistered(Identity identity)
    {
        foreach (Identity id in mIdentities)
        {
            if (id.Equals(identity))
            {
                return true;
            }
        }
        return false;
    }

    public static bool AreSameObject(Identity identityA, Identity identityB)
    {
        return identityA == identityB;
    }

    HashSet<Identity> mIdentities = [];

}
