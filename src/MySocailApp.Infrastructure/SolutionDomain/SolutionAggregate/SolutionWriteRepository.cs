using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionAggregate
{
    public class SolutionWriteRepository(AppDbContext context) : ISolutionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Solution solution, CancellationToken cancellationToken)
            => await _context.AddAsync(solution, cancellationToken);

        public void Delete(Solution solution)
            => _context.Solutions.Remove(solution);

        public void DeleteRange(IEnumerable<Solution> solutions)
            => _context.Solutions.RemoveRange(solutions);

        public Task<Solution?> GetWithVoteByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Votes.Where(x => x.UserId == voterId))
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);

        public Task<Solution?> GetWithVoteAndVoteNotificationByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Votes.Where(x => x.UserId == voterId))
                .Include(x => x.VoteNotifications.Where(x => x.UserId == voterId))
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);

        public Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<Solution?> GetWithImagesByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<List<Solution>> GetUserSolutionsAsync(int userId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .Where(x => x.UserId == userId)
                .ToListAsync(cancellationToken);

        public Task<List<Solution>> GetQuestionSolutionsAsync(int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .Where(x => x.QuestionId == questionId)
                .ToListAsync(cancellationToken);

        public Task<Solution?> GetSolutionAsync(int solutionId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);
        
        public async Task DeleteSolutionUserVotesByUserId(int userId, CancellationToken cancellationToken)
        {
            var votes = await _context.SolutionUserVotes.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
            _context.SolutionUserVotes.RemoveRange(votes);
        }
        public async Task DeleteSolutionUserVoteNotificationsByUserId(int userId, CancellationToken cancellationToken)
        {
            var notifications = await _context.SolutionUserVoteNotifications.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
            _context.SolutionUserVoteNotifications.RemoveRange(notifications);
        }
    }
}
