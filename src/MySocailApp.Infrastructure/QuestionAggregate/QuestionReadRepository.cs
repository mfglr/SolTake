using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionReadRepository(AppDbContext context) : IQuestionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .Include(x => x.Exam)
                .Include(x => x.Subject)
                .Include(x => x.Images)
                .Include(x => x.Topics)
                .ThenInclude(x => x.Topic)
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Question>> GetByUserIdAsync(int userId, int? lastId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .Include(x => x.Exam)
                .Include(x => x.Subject)
                .Include(x => x.Images)
                .Include(x => x.Topics)
                .ThenInclude(x => x.Topic)
                .Include(x => x.AppUser)
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes)
                .Where(x => x.AppUserId == userId && (lastId == null || x.Id < lastId))
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetByTopicIdAsync(int topicId, int? lastId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .Include(x => x.Exam)
                .Include(x => x.Subject)
                .Include(x => x.Images)
                .Include(x => x.Topics)
                .ThenInclude(x => x.Topic)
                .Include(x => x.AppUser)
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes)
                .Where(x => x.Topics.Any(x => x.TopicId == topicId) && (lastId == null || x.Id < lastId))
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
    }
}
