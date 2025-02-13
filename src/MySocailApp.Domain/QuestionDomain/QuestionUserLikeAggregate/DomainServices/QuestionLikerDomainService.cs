using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainServices
{
    public class QuestionLikerDomainService(IQuestionUserLikeReadRepository questionUserLikeReadRepository)
    {
        private readonly IQuestionUserLikeReadRepository _questionUserLikeReadRepository = questionUserLikeReadRepository;

        public async Task LikeAsync(int questionId, int userId, CancellationToken cancellationToken)
        {
            if (await _questionUserLikeReadRepository.IsLikedAsync(questionId, userId, cancellationToken))
                throw new QuestionAlreadyLikedException();
        }
    }
}
