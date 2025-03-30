using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IUnitOfWork unitOfWork, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository, IQuestionUserLikeReadRepository questionUserLikeRepository, IQuestionReadRepository questionReadRepository, IPublisher publisher, IAccessTokenReader accessTokenReader) : IRequestHandler<LikeQuestionDto, LikeQuestionCommandResponseDto>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IQuestionUserLikeReadRepository _questionUserLikeRepository = questionUserLikeRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task<LikeQuestionCommandResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var questionUserId =
                await _questionReadRepository.GetUserIdOfQuestionAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _questionUserLikeRepository.IsLikedAsync(request.QuestionId, login.UserId, cancellationToken))
                throw new QuestionAlreadyLikedException();

            var like = QuestionUserLike.Create(request.QuestionId, login.UserId);
            await _questionUserLikeWriteRepository.CreateAsync(like, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            if (questionUserId != login.UserId)
                await _publisher.Publish(new QuestionLikedDomainEvent(like, login, questionUserId), cancellationToken);

            return new(like, login);
        }
    }
}
