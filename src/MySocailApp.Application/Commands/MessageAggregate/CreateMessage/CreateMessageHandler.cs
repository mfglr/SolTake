using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageAggregate.CreateMessage
{
    public class CreateMessageHandler(IAccessTokenReader tokenReader, IImageService blobService, IUnitOfWork unitOfWork, IMessageQueryRepository messageQueryRepository, MessageCreaterDomainService messageCreator) : IRequestHandler<CreateMessageDto, MessageResponseDto>
    {
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly MessageCreaterDomainService _messageCreator = messageCreator;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IImageService _blobService = blobService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<MessageResponseDto> Handle(CreateMessageDto request, CancellationToken cancellationToken)
        {
            IEnumerable<MessageImage>? messageImages = null;
            if (request.Images != null)
            {
                var images = await _blobService.UploadAsync(ContainerName.MesssageImages, request.Images, cancellationToken);
                messageImages = images.Select(x => new MessageImage(x.BlobName, x.Dimention.Height, x.Dimention.Width));
            }
            
            var senderId = _tokenReader.GetRequiredAccountId();
            var content = request.Content != null ? new MessageContent(request.Content) : null;
            var message = new Message(senderId, request.ReceiverId, content, messageImages);
            await _messageCreator.CreateAsync(message,cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _messageQueryRepository.GetMessageByIdAsync(senderId, message.Id, cancellationToken))!;
        }
    }
}
