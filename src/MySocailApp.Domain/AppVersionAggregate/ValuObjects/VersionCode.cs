using MySocailApp.Domain.AppVersionAggregate.Exceptions;
using System.Text.RegularExpressions;

namespace MySocailApp.Domain.AppVersionAggregate.ValuObjects
{
    public class VersionCode
    {
        public readonly static VersionCode DefaultVersionCode = new ("1.0.0");
        
        public string Value { get; private set; }

        public VersionCode(string value)
        {
            if (!Regex.IsMatch(value, @"^\d+\.\d+\.\d+$"))
                throw new InvalidVersionCodeException();

            Value = value;
        }

        public static int CompareTo(VersionCode a, VersionCode b)
        {
            int locationA = 0;
            int locationB = 0;
            for (int i = 0; i < 3; i++)
            {
                string partStringA = "";
                while (locationA < a.Value.Length && a.Value[locationA] != '.')
                {
                    partStringA += a.Value[locationA];
                    locationA++;
                }
                int partA = int.Parse(partStringA);
                locationA++;

                string partStringB = "";
                while (locationB < b.Value.Length && b.Value[locationB] != '.')
                {
                    partStringB += b.Value[locationB];
                    locationB++;
                }
                int partB = int.Parse(partStringB);
                locationB++;

                if (partA < partB) return -1;
                if (partA > partB) return 1;
            }
            return 0;
        }
    }
}
