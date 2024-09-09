using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Commands.MessageAggregate.CreateMessage
{
    public class CreateMessageHandler(IMessageWriteRepository messageRepository, IAccessTokenReader tokenReader, IBlobService blobService, IUnitOfWork unitOfWork, IMessageQueryRepository messageQueryRepository) : IRequestHandler<CreateMessageDto, MessageResponseDto>
    {
        private readonly IMessageWriteRepository _messageRepository = messageRepository;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IBlobService _blobService = blobService;
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
            var message = new Message(senderId, request.ReceiverId, request.Content, messageImages);
            message.Create();
            await _messageRepository.CreateAsync(message, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _messageQueryRepository.GetMessageByIdAsync(senderId, message.Id, cancellationToken))!;
        }
    }
}
