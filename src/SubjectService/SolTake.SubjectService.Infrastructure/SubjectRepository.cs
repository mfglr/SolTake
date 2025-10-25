using MongoDB.Driver;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Infrastructure
{
    internal class SubjectRepository(MongoContext context) : ISubjectRepository
    {
        private readonly MongoContext _context = context;

        public Task CreateAsync(Subject subject, CancellationToken cancellationToken)
            => _context.Subjects.InsertOneAsync(subject, cancellationToken: cancellationToken);

        public async Task<bool> ExistAsync(SubjectName name, CancellationToken cancellationToken)
        {
            var filter = Builders<Subject>.Filter.Eq(s => s.Name, name);
            var documet = await _context.Subjects.FindAsync(filter, cancellationToken: cancellationToken);
            return await documet.AnyAsync(cancellationToken);
        }
    }
}
