using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionUserLikeAggregate.Abstracts;
using SolTake.Domain.QuestionUserLikeAggregate.Entities;
using SolTake.Domain.QuestionUserLikeAggregate.Exceptions;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Core;

namespace SolTake.Domain.QuestionUserLikeAggregate.DomainServices
{
    public class QuestionUserLikeCreatorDomainService(IQuestionUserLikeReadRepository questionUserLikeReadRepository, IQuestionReadRepository questionReadRepository, IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IQuestionUserLikeReadRepository _questionUserLikeReadRepository = questionUserLikeReadRepository;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task CreateAsync(QuestionUserLike questionUserLike, Login login, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(questionUserLike.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(question.UserId, questionUserLike.UserId, cancellationToken))
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(questionUserLike.UserId, question.UserId, cancellationToken))
                throw new UserBlockedException();
            
            if (await _questionUserLikeReadRepository.IsLikedAsync(questionUserLike.QuestionId, questionUserLike.UserId, cancellationToken))
                throw new QuestionAlreadyLikedException();

            questionUserLike.Create(question, login);
        }
    }
}
