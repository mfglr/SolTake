using SolTake.Domain.QuestionUserComplaintAggregate.Entities;

namespace SolTake.Domain.QuestionUserComplaintAggregate.Abstracts
{
    public interface IQuestionUserComplaintRepository
    {
        Task CreateAsync(QuestionUserComplaint questionUserComplaint, CancellationToken cancellationToken);
        Task<QuestionUserComplaint?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
