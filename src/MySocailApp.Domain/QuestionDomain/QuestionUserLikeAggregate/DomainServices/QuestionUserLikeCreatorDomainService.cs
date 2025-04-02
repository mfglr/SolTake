using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainServices
{
    public class QuestionUserLikeCreatorDomainService(IQuestionUserLikeReadRepository questionUserLikeReadRepository, IQuestionReadRepository questionReadRepository)
    {
        private readonly IQuestionUserLikeReadRepository _questionUserLikeReadRepository = questionUserLikeReadRepository;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        public async Task CreateAsync(QuestionUserLike like, Login login, CancellationToken cancellationToken)
        {
            var question = 
                await _questionReadRepository.GetAsync(like.QuestionId,cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _questionUserLikeReadRepository.IsLikedAsync(like.QuestionId, like.UserId, cancellationToken))
                throw new QuestionAlreadyLikedException();

            like.Create(question,login);
        }
    }
}
