using MongoDB.Bson.Serialization;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Infrastructure
{
    public static class DbConfigration
    {
        public static void Configure()
        {
            BsonClassMap.RegisterClassMap<Subject>(cm =>
            {
                cm.MapIdMember(p => p.Name);
                cm.MapMember(p => p.CreatedAt);
                cm.MapMember(p => p.Version);
            });
        }
    }
}
