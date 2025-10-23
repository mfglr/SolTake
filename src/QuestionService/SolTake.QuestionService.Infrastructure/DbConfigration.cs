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
            BsonClassMap.RegisterClassMap<Question>(cm =>
            {
                cm.MapIdMember(p => p.Id);
                cm.MapMember(p => p.CreatedAt);
                cm.MapMember(p => p.Version);
                cm.MapMember(p => p.UserId);
                cm.MapMember(p => p.Content);
                cm.MapMember(p => p.ExamId);
                cm.MapMember(p => p.SubjectId);
                cm.MapMember(p => p.Topics);
                cm.MapMember(p => p.Media);

                cm.IdMemberMap.SetSerializer(new GuidSerializer(GuidRepresentation.Standard));
            });
        }
    }
}
