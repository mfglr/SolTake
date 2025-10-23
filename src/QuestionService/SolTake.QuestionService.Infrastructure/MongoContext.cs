using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using SolTake.QuestionService.Domain.Entities;

namespace SolTake.QuestionService.Infrastructure
{
    internal class MongoContext
    {
        public IMongoClient Client { get; set; }
        public IMongoCollection<Question> Questions { get; set; }

        public MongoContext(IConfiguration configuration)
        {
            Client = new MongoClient(configuration["MongoDbSettings:ConnectionString"]!);
            var database = Client.GetDatabase(configuration["MongoDbSettings:DatabaseName"]!);
            Questions = database.GetCollection<Question>("questions");
        }

    }
}
