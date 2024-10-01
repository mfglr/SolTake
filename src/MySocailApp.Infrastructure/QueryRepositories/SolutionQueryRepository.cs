using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class SolutionQueryRepository(AppDbContext context) : ISolutionQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<SolutionResponseDto?> GetByIdAsync(int accountId, int solutionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.Id == solutionId && !x.IsRemoved)
                .ToSolutionResponseDto(accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetSolutionsByQuestionIdAsync(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && !x.IsRemoved)
                .ToPage(page)
                .ToSolutionResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetCorrectSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.State == SolutionState.Correct && !x.IsRemoved)
                .ToPage(page)
                .ToSolutionResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetPendingSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
           => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.State == SolutionState.Pending && !x.IsRemoved)
                .ToPage(page)
                .ToSolutionResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetIncorrectSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.State == SolutionState.Incorrect && !x.IsRemoved)
                .ToPage(page)
                .ToSolutionResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionResponseDto>> GetVideoSolutions(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId && x.Video != null && !x.IsRemoved)
                .ToPage(page)
                .ToSolutionResponseDto(accountId)
                .ToListAsync(cancellationToken);
    }
}
