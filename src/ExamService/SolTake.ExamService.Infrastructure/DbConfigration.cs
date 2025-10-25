using MongoDB.Bson.Serialization;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Infrastructure
{
    public static class DbConfiguration
    {
        public static void Configure()
        {
            BsonClassMap.RegisterClassMap<Exam>(cm =>
            {
                cm.MapIdMember(p => p.Name);
                cm.MapMember(p => p.CreatedAt);
                cm.MapMember(p => p.Version);
                cm.MapMember(p => p.Initialism);
                cm.MapMember(p => p.Subjects);
            });
        }
    }
}
