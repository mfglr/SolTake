using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.SetMessageConnectionStateAsTyping
{
    public class SetMessageConnectionStateAsTypingHandler(IMessageConnectionWriteRepository messageConnectionWriteRepository, IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<SetMessageConnectionStateAsTypingDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMessageConnectionWriteRepository _messageConnectionWriteRepository = messageConnectionWriteRepository;

        public async Task Handle(SetMessageConnectionStateAsTypingDto request, CancellationToken cancellationToken)
        {
            var connection =
                await _messageConnectionWriteRepository.GetByIdAsync(_userAccessor.User.Id, cancellationToken) ??
                throw new MessageConnectionNotFoundException();

            connection.SetStateAsWriting(request.TypingId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
