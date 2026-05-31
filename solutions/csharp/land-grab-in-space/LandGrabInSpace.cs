public struct Coord
{
    public Coord(ushort x, ushort y)
    {
        X = x;
        Y = y;
    }

    public ushort X { get; }
    public ushort Y { get; }
}

public struct Plot
{
    public Plot(Coord coord0, Coord coord1, Coord coord2, Coord coord3)
    {
        mCoord0 = coord0;
        mCoord1 = coord1;
        mCoord2 = coord2;
        mCoord3 = coord3;
    }
    Coord mCoord0;
    Coord mCoord1;
    Coord mCoord2;
    Coord mCoord3;

    public int Side() => Math.Max(Math.Abs(mCoord0.X - mCoord1.X), Math.Abs(mCoord1.X - mCoord2.Y));
}

public class ClaimsHandler
{
    public void StakeClaim(Plot plot) => claims = [.. claims, plot];
    public bool IsClaimStaked(Plot plot) => claims.Contains(plot);
    public bool IsLastClaim(Plot plot) => plot.Equals(claims[^1]);

    public Plot GetClaimWithLongestSide()
    {
        int longestSideIdx = 0;
        int longestSide = 0;

        for (int i = 0; i < claims.Length; i++)
        {
            if (claims[i].Side() >= longestSide)
            {
                longestSide = claims[i].Side();
                longestSideIdx = i;
            }
        }

        return claims[longestSideIdx];
    }

    Plot[] claims = [];
}
