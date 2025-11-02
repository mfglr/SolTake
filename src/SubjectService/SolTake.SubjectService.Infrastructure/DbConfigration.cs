using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Infrastructure
{
    public static class DbConfigration
    {
        public static void Configure()
        {
            BsonSerializer.RegisterSerializer(new GuidSerializer(GuidRepresentation.Standard));
            BsonClassMap.RegisterClassMap<Subject>(cm =>
            {
                cm.MapIdMember(p => p.Id);
                cm.MapMember(p => p.Name);
                cm.MapMember(p => p.CreatedAt);
                cm.MapMember(p => p.Version);
            });
        }
    }
}
