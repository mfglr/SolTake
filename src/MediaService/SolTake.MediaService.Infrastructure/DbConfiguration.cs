using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Infrastructure
{
    public static class DbConfiguration
    {
        public static void Configure()
        {
            BsonSerializer.RegisterSerializer(new GuidSerializer(GuidRepresentation.Standard));
            BsonClassMap.RegisterClassMap<Media>(cm =>
            {
                cm.MapIdMember(m => m.Id);
                cm.MapMember(m => m.CreatedAt);
                cm.MapMember(m => m.Version);
                cm.MapMember(m => m.Type);
                cm.MapMember(m => m.OwnerId);
                cm.MapMember(m => m.ContainerName);
                cm.MapMember(m => m.BlobName);
                cm.MapMember(m => m.TranscodedBlobName);
                cm.MapMember(m => m.Thumbnails);
                cm.MapMember(m => m.Dimention);
                cm.MapMember(m => m.NsfwScores);
            });
        }
    }
}
