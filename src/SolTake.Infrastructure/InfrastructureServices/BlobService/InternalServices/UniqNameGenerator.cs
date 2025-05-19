namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class UniqNameGenerator
    {
        public string Generate(string? extention = null)
        {
            if (extention == null)
                return $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
            return $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}.{extention}";
        }
    }
}
