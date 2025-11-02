using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;
using SolTake.QuestionService.Domain.Entities;

namespace SolTake.QuestionService.Infrastructure
{
    public static class DbConfiguration
    {
        public static void Configure()
        {
            BsonSerializer.RegisterSerializer(new GuidSerializer(GuidRepresentation.Standard));
            BsonClassMap.RegisterClassMap<Question>(cm =>
            {
                cm.MapIdMember(q => q.Id);
                cm.MapMember(q => q.CreatedAt);
                cm.MapMember(q => q.Version);
                cm.MapMember(q => q.UserId);
                cm.MapMember(q => q.Content);
                cm.MapMember(q => q.Exam);
                cm.MapMember(q => q.Subject);
                cm.MapMember(q => q.Topics);
                cm.MapMember(q => q.NumberOfMedia);
            });
        }
    }
}
