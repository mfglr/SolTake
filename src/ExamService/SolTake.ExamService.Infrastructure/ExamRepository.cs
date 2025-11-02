using MongoDB.Driver;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Infrastructure
{
    internal class ExamRepository(MongoContext context) : IExamRepository
    {
        private readonly MongoContext _context = context;

        public Task CreateAsync(Exam exam, CancellationToken cancellationToken) =>
            _context.Exams.InsertOneAsync(exam, cancellationToken: cancellationToken);

        public async Task DeleteAsync(Guid id, CancellationToken cancellationToken)
        {
            var filter = Builders<Exam>.Filter.Eq(c => c.Id, id);
            await _context.Exams.DeleteOneAsync(filter, cancellationToken: cancellationToken);
        }

        public async Task<bool> ExistAsync(Guid id, CancellationToken cancellationToken)
        {
            var filter = Builders<Exam>.Filter.Eq(e => e.Id, id);
            var document = await _context.Exams.FindAsync(filter, cancellationToken: cancellationToken);
            return await document.AnyAsync(cancellationToken);
        }

        public async Task<bool> ExistAsync(ExamName name, CancellationToken cancellationToken)
        {
            var filter = Builders<Exam>.Filter.Eq(e => e.Name, name);
            var document = await _context.Exams.FindAsync(filter, cancellationToken: cancellationToken);
            return await document.AnyAsync(cancellationToken);
        }

        public async Task<Exam?> GetByIdAsync(Guid id, CancellationToken cancellationToken)
        {
            var filter = Builders<Exam>.Filter.Eq(c => c.Id, id);
            var document = await _context.Exams.FindAsync(filter, cancellationToken: cancellationToken);
            return await document.FirstOrDefaultAsync(cancellationToken);
        }

        public async Task UpdateAsync(Exam exam, CancellationToken cancellationToken)
        {
            var filter = Builders<Exam>.Filter.And(
                Builders<Exam>.Filter.Eq(c => c.Name, exam.Name),
                Builders<Exam>.Filter.Eq(c => c.Version, exam.Version - 1)
            );
            var result = await _context.Exams.ReplaceOneAsync(filter, exam, cancellationToken: cancellationToken);
            if (result.ModifiedCount == 0)
                throw new ConcurrencyException();
        }
    }
}
