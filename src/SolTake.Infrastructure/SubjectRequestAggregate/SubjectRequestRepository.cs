using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SubjectRequestAggregate.Abstracts;
using SolTake.Domain.SubjectRequestAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SubjectRequestAggregate
{
    internal class SubjectRequestRepository(AppDbContext context) : ISubjectRequestRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(SubjectRequest subjectRequest, CancellationToken cancellationToken)
            => await _context.SubjectRequests.AddAsync(subjectRequest, cancellationToken);

        public void Delete(SubjectRequest subjectRequest)
            => _context.SubjectRequests.Remove(subjectRequest);

        public Task<SubjectRequest?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.SubjectRequests.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
