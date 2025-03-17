using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserReceiveAggregate.Create
{
    public class CreateMessageUserReceiveHandler(IMessageUserReceiveWriteRepository messageUserReceiveWriteRepository, IUnitOfWork unitOfWork, IUserAccessor userAccessor, IMessageUserReceiveReadRepository messageUserReceiveReadRepository, IMessageReadRepository messageReadRepository) : IRequestHandler<CreateMessageUserReceiveDto, CreateMessageUserReceiveResponseDto>
    {
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IMessageUserReceiveReadRepository _messageUserReceiveReadRepository = messageUserReceiveReadRepository;
        private readonly IMessageUserReceiveWriteRepository _messageUserReceiveWriteRepository = messageUserReceiveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task<CreateMessageUserReceiveResponseDto> Handle(CreateMessageUserReceiveDto request, CancellationToken cancellationToken)
        {
            var message = 
                await _messageReadRepository.GetByIdAsync(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (message.ReceiverId != _userAccessor.User.Id)
                throw new MessageAccessDeniedException();

            if (await _messageUserReceiveReadRepository.ExistAsync(request.MessageId, _userAccessor.User.Id, cancellationToken))
                throw new MessageAlreadyReceivedException();

            var messageUserReceive = MessageUserReceive.Create(request.MessageId, _userAccessor.User.Id);
            await _messageUserReceiveWriteRepository.CreateAsync(messageUserReceive, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(messageUserReceive.Id);
        }
    }
}
