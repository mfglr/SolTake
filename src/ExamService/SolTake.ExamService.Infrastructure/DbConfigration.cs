using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Infrastructure
{
    public static class DbConfiguration
    {
        public static void Configure()
        {
            BsonClassMap.RegisterClassMap<Exam>(cm =>
            {
                cm.MapIdMember(p => p.Id);
                cm.MapMember(p => p.Name);
                cm.MapMember(p => p.CreatedAt);
                cm.MapMember(p => p.Version);
                cm.MapMember(p => p.Initialism);
                cm
                    .MapMember(p => p.Subjects)
                    .SetSerializer(
                        new EnumerableInterfaceImplementerSerializer<List<Guid>>(
                            new GuidSerializer(GuidRepresentation.Standard)
                        )
                    );
                cm.IdMemberMap.SetSerializer(new GuidSerializer(GuidRepresentation.Standard));
            });
        }
    }
}
