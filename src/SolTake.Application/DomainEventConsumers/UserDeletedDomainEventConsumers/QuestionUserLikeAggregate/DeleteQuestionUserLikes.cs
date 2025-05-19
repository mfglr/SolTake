using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.QuestionUserLikeAggregate
{
    public class DeleteQuestionUserLikes(IUnitOfWork unitOfWork, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var likes = await _questionUserLikeWriteRepository.GetByUserIdAsync(notification.User.Id, cancellationToken);
            _questionUserLikeWriteRepository.DeleteRange(likes);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
