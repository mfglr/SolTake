using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class QuestionFinder(AppDbContext context) : IQuestionFinder
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Questions.AnyAsync(x => x.Id == id, cancellationToken);
    }
}
