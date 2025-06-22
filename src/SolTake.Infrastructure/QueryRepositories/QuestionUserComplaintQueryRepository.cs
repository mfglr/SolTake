using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.QuestionUserComplaintAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class QuestionUserComplaintQueryRepository(AppDbContext context) : IQuestionUserComplaintQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<QuestionUserComplaintResponseDto>> GetUnviewedQuestionUserComplaintsAsync(IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserComplaints
                .AsNoTracking()
                .Where(x => !x.IsViewed)
                .ToPage(page)
                .ToQuestionUserComplaintResponseDto(_context)
                .ToListAsync(cancellationToken);


    }
}
