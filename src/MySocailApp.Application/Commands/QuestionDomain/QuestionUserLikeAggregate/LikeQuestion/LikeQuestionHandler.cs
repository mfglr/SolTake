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
    public class LikeQuestionHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository, IQuestionUserLikeReadRepository questionUserLikeRepository, IQuestionReadRepository questionReadRepository, IPublisher publisher) : IRequestHandler<LikeQuestionDto, LikeQuestionCommandResponseDto>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IQuestionUserLikeReadRepository _questionUserLikeRepository = questionUserLikeRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task<LikeQuestionCommandResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            if (!await _questionReadRepository.ExistAsync(request.QuestionId, cancellationToken))
                throw new QuestionNotFoundException();

            if (await _questionUserLikeRepository.IsLikedAsync(request.QuestionId, _userAccessor.User.Id, cancellationToken))
                throw new Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions.QuestionAlreadyLikedException();

            var like = QuestionUserLike.Create(request.QuestionId, _userAccessor.User.Id);
            await _questionUserLikeWriteRepository.CreateAsync(like, cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);

            var userIdOfQuestion = await _questionReadRepository.GetUserIdOfQuestionAsync(request.QuestionId, cancellationToken);
            if (userIdOfQuestion != _userAccessor.User.Id)
                await _publisher.Publish(new QuestionLikedDomainEvent(like),cancellationToken);

            return new(like, _userAccessor.User);
        }
    }
}
