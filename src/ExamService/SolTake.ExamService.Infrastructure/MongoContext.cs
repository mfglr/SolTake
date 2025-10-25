using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Infrastructure
{
    internal class MongoContext
    {
        private readonly MongoClient _client;
        public IMongoCollection<Exam> Exams { get; set; }

        public MongoContext(IConfiguration configuration)
        {
            _client = new MongoClient(configuration["MongoDbSettings:ConnectionString"]!);
            var database = _client.GetDatabase(configuration["MongoDbSettings:DatabaseName"]!);
            Exams = database.GetCollection<Exam>("exams");
        }

    }
}
