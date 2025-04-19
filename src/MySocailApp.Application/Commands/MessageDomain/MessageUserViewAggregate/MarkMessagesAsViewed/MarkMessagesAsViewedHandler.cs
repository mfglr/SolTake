using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageUserViewAggregate.Abstracts;
using MySocailApp.Domain.MessageUserViewAggregate.Entities;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserViewAggregate.MarkMessagesAsViewed
{
    public class MarkMessagesAsViewedHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IMessageUserViewWriteRepository messageUserViewWriteRepository, IMessageUserViewReadRepository messageUserViewReadRepository) : IRequestHandler<MarkMessagesAsViewedDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMessageUserViewWriteRepository _messageUserViewWriteRepository = messageUserViewWriteRepository;
        private readonly IMessageUserViewReadRepository _messageUserViewReadRepository = messageUserViewReadRepository;

        public async Task Handle(MarkMessagesAsViewedDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageIds = await _messageUserViewReadRepository.GetIdOfMessagesNotViewedByUser(request.MessageIds, userId, cancellationToken);
            var messageUserViews = messageIds.Select(x => MessageUserView.Create(x, userId));
            await _messageUserViewWriteRepository.CreateRangeAsync(messageUserViews, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
