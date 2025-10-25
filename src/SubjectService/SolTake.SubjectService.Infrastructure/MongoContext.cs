using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Infrastructure
{
    internal class MongoContext
    {
        private readonly MongoClient _client;
        public IMongoCollection<Subject> Subjects { get; set; }

        public MongoContext(IConfiguration configuration)
        {
            _client = new MongoClient(configuration["MongoDbSettings:ConnectionString"]!);
            var database = _client.GetDatabase(configuration["MongoDbSettings:DatabaseName"]!);
            Subjects = database.GetCollection<Subject>("subjects");
        }
    }
}
