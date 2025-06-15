using Microsoft.EntityFrameworkCore;
using SolTake.Domain.ExamRequestAggregate.Abstracts;
using SolTake.Domain.ExamRequestAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.ExamRequestAggregate
{
    internal class ExamRequestRepository(AppDbContext context) : IExamRequestRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(ExamRequest examRequest, CancellationToken cancellationToken)
            => await _context.ExamRequests.AddAsync(examRequest, cancellationToken);

        public void Delete(ExamRequest examRequest)
            => _context.ExamRequests.Remove(examRequest);

        public Task<ExamRequest?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.ExamRequests.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
