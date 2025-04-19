using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.QuestionUserLikeAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Abstracts;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.DomainServices
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
