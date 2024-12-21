using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageAggregate.CreateMessage
{
    public class CreateMessageHandler(IAccessTokenReader tokenReader, IUnitOfWork unitOfWork, IMessageQueryRepository messageQueryRepository, MessageCreaterDomainService messageCreator, IMultimediaService multimediaService) : IRequestHandler<CreateMessageDto, MessageResponseDto>
    {
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly MessageCreaterDomainService _messageCreator = messageCreator;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<MessageResponseDto> Handle(CreateMessageDto request, CancellationToken cancellationToken)
        {
            IEnumerable<MessageMultimedia>? messageImages = null;
            if (request.Images != null)
            {
                var images = await _multimediaService.UploadAsync(ContainerName.MesssageImages, request.Images, cancellationToken);
                messageImages = images.Select(x => new MessageMultimedia(x));
            }

            var senderId = _tokenReader.GetRequiredAccountId();
            var content = request.Content != null ? new MessageContent(request.Content) : null;
            var message = new Message(senderId, request.ReceiverId, content, messageImages);
            await _messageCreator.CreateAsync(message, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _messageQueryRepository.GetMessageByIdAsync(senderId, message.Id, cancellationToken))!;
        }
    }
}
