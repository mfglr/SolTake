using Microsoft.EntityFrameworkCore;
using MongoDB.Driver;
using SolTake.QuestionService.Domain.Abstracts;
using SolTake.QuestionService.Domain.Entities;

namespace SolTake.QuestionService.Infrastructure
{
    internal class QuestionRepository(MongoContext context) : IQuestionRepository
    {
        private readonly MongoContext _context = context;

        public Task CreateAsync(Question question, CancellationToken cancellationToken) =>
            _context.Questions.InsertOneAsync(question,cancellationToken: cancellationToken);

        public async Task DeleteAsync(Guid id, CancellationToken cancellationToken)
        {
            var filter = Builders<Question>.Filter.Eq(c => c.Id, id);
            await _context.Questions.DeleteOneAsync(filter, cancellationToken: cancellationToken);
        }


        public async Task<Question?> GetByIdAsync(Guid id, CancellationToken cancellationToken)
        {
            var filter = Builders<Question>.Filter.Eq(c => c.Id, id);
            var documents = await _context.Questions.FindAsync(filter, cancellationToken: cancellationToken);
            return await documents.FirstOrDefaultAsync(cancellationToken);
        }

        public async Task UpdateAsync(Question question, CancellationToken cancellationToken)
        {
            var filter = Builders<Question>.Filter.And(
                Builders<Question>.Filter.Eq(c => c.Id, question.Id),
                Builders<Question>.Filter.Eq(c => c.Version, question.Version - 1)
            );

            var result = await _context.Questions.ReplaceOneAsync(filter, question,cancellationToken: cancellationToken);
            if (result.ModifiedCount == 0)
                throw new ConcurrencyException();
        }
    }
}
