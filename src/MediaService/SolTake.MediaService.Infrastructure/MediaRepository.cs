using MongoDB.Driver;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Infrastructure
{
    internal class MediaRepository(MongoContext context) : IMediaRepository
    {
        private readonly MongoContext _context = context;

        public Task CreateAsync(Media media, CancellationToken cancellationToken) =>
            _context.Media.InsertOneAsync(media, cancellationToken: cancellationToken);

        public Task CreateManyAsync(IEnumerable<Media> media, CancellationToken cancellationToken) =>
            _context.Media.InsertManyAsync(media, cancellationToken: cancellationToken);

        public async Task<Media?> GetByIdAsync(Guid id, CancellationToken cancellationToken)
        {
            var filter = Builders<Media>.Filter.Eq(x => x.Id, id);
            using var document = await _context.Media.FindAsync(filter, cancellationToken: cancellationToken);
            return await document.FirstOrDefaultAsync(cancellationToken);
        }

        public async Task UpdateAsync(Media media, CancellationToken cancellationToken)
        {
            var filter =
                Builders<Media>.Filter.And(
                    Builders<Media>.Filter.Eq(x => x.Id, media.Id),
                    Builders<Media>.Filter.Eq(x => x.Version, media.Version - 1)
                );

            var response = await _context.Media.ReplaceOneAsync(filter, media, cancellationToken: cancellationToken);
            if (response.ModifiedCount == 0)
                throw new ConcurrencyException();
        }
    }
}
