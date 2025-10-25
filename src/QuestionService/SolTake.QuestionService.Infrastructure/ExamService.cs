using Microsoft.Extensions.Configuration;
using SolTake.QuestionService.Domain.Abstracts;
using System.Text.Json;

namespace SolTake.QuestionService.Infrastructure
{
    internal class ExamService(IConfiguration configration) : IExamService
    {
        private readonly IConfiguration _configration = configration;

        public async Task<bool> ExistAsync(string name, CancellationToken cancellationToken)
        {
            var client = new HttpClient();
            var url = @$"{_configration["ExamService"]}/exams/exist/{name}";
            var response = await client.GetAsync(url, cancellationToken);
            var content = await response.Content.ReadAsStringAsync(cancellationToken);
            return JsonSerializer.Deserialize<bool>(content)!;
        }
    }
}
