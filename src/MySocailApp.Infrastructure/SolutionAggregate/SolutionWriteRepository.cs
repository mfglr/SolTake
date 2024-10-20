using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionAggregate
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
                .Include(x => x.Votes.Where(x => x.AppUserId == voterId))
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);

        public Task<Solution?> GetWithVoteAndVoteNotificationByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Votes.Where(x => x.AppUserId == voterId))
                .Include(x => x.VoteNotifications.Where(x => x.AppUserId == voterId))
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);

        public Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<Solution?> GetWithImagesByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<Solution?> GetWithSaverByIdAsync(int solutionId, int saverId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Savers.Where(x => x.AppUserId == saverId))
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);
        
        public Task<List<Solution>> GetUserSolutionsAsync(int userId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Images)
                .Where(x => x.AppUserId == userId)
                .ToListAsync(cancellationToken);

        public Task<List<Solution>> GetQuestionSolutionsAsync(int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Images)
                .Where(x => x.QuestionId == questionId)
                .ToListAsync(cancellationToken);

        public Task<Solution?> GetSolutionAsync(int solutionId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == solutionId, cancellationToken);

        public async Task DeleteSolutionUserSavesByUserId(int userId, CancellationToken cancellation)
        {
            var saves = await _context.SolutionUserSaves.Where(x => x.AppUserId == userId).ToListAsync(cancellation);
            _context.SolutionUserSaves.RemoveRange(saves);
        }
        public async Task DeleteSolutionUserVotesByUserId(int userId, CancellationToken cancellationToken)
        {
            var votes = await _context.SolutionUserVotes.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.SolutionUserVotes.RemoveRange(votes);
        }
        public async Task DeleteSolutionUserVoteNotificationsByUserId(int userId, CancellationToken cancellationToken)
        {
            var notifications = await _context.SolutionUserVoteNotifications.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.SolutionUserVoteNotifications.RemoveRange(notifications);
        }
    }
}
