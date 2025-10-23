using Microsoft.Extensions.Configuration;

namespace SolTake.NsfwDetector.Infrastructure
{
    internal class NsfwClient : HttpClient
    {
        public NsfwClient(IConfiguration configuration)
        {
            BaseAddress = new Uri($"{configuration["ChatGPT:BaseUrl"]!}/moderations");
            DefaultRequestHeaders.Authorization = new("Bearer", configuration["ChatGPT:ApiKey"]);
        }
    }
}
