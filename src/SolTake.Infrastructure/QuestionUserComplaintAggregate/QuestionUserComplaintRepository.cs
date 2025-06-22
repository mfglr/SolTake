using Microsoft.EntityFrameworkCore;
using SolTake.Domain.QuestionUserComplaintAggregate.Abstracts;
using SolTake.Domain.QuestionUserComplaintAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QuestionUserComplaintAggregate
{
    internal class QuestionUserComplaintRepository(AppDbContext context) : IQuestionUserComplaintRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(QuestionUserComplaint questionUserComplaint, CancellationToken cancellationToken)
            => await _context.QuestionUserComplaints.AddAsync(questionUserComplaint,cancellationToken);

        public Task<QuestionUserComplaint?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.QuestionUserComplaints.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
