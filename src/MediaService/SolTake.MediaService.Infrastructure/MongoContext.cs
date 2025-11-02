using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Infrastructure
{
    internal class MongoContext
    {
        public IMongoClient Client { get; private set; }
        public IMongoCollection<Media> Media { get; private set; }

        public MongoContext(IConfiguration configuration)
        {
            Client = new MongoClient(configuration["MongoDbSettings:ConnectionString"]!);
            var database = Client.GetDatabase(configuration["MongoDbSettings:DatabaseName"]!);
            Media = database.GetCollection<Media>("media");
        }

    }
}
