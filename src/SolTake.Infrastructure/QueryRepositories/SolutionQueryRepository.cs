using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SolutionDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class SolutionQueryRepository(AppDbContext context) : ISolutionQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<SolutionResponseDto?> GetByIdAsync(int accountId, int solutionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.Id == solutionId)
                .ToSolutionResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public async Task<List<SolutionResponseDto>> GetSolutionsByQuestionIdAsync(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
        {
            var s = await _context.Solutions.ToListAsync(cancellationToken);

            return await _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId)
                .ToPage(page)
                .ToSolutionResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
        }

        public Task<List<SolutionResponseDto>> GetCorrectSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.State == SolutionState.Correct)
                .ToPage(page)
                .ToSolutionResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetPendingSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
           => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.State == SolutionState.Pending)
                .ToPage(page)
                .ToSolutionResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetIncorrectSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.State == SolutionState.Incorrect)
                .ToPage(page)
                .ToSolutionResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetVideoSolutions(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.Medias.Any(x => x.MultimediaType == MultimediaType.Video))
                .ToPage(page)
                .ToSolutionResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
