using Orleans;
using QuestionWriteService.Domain.ValuObjects;

namespace QuestionWriteService.Domain.DomainServices
{
    public interface IQuestionGrain : IGrainWithIntegerKey
    {
        Task<QuestionState> Get();
        Task Create(int userId, QuestionContent content, IEnumerable<QuestionImage> images);
    }
}
