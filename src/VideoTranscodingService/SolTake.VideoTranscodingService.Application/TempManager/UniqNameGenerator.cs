namespace SolTake.VideoTranscodingService.Application.TempManager
{
    public class UniqNameGenerator
    {
        internal string Generate(string? extention = null)
        {
            if (extention == null)
                return $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
            return $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}.{extention}";
        }
    }
}
