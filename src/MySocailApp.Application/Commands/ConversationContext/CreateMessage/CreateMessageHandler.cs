using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;
using MySocailApp.Domain.ConversationContext.MessageAggregate.DomainServices;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Application.Commands.ConversationContext.CreateMessage
{
    public class CreateMessageHandler(MessageCreatorDomainService messageCreator, IAccessTokenReader tokenReader, IMapper mapper, IUnitOfWork unitOfWork, IBlobService blobService) : IRequestHandler<CreateMessageDto, MessageResponseDto>
    {
        private readonly MessageCreatorDomainService _messageCreator = messageCreator;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;

        public async Task<MessageResponseDto> Handle(CreateMessageDto request, CancellationToken cancellationToken)
        {
            IEnumerable<MessageImage>? messageImages = null;
            if(request.Images != null)
            {
                var images = await _blobService.UploadAsync(ContainerName.MesssageImages, request.Images, cancellationToken);
                messageImages = images.Select(x => new MessageImage(x.BlobName, x.Dimention.Height, x.Dimention.Width));
            }
            
            var senderId = _tokenReader.GetRequiredAccountId();
            
            var message = new Message(senderId, request.ReceiverId, request.Content, messageImages);
            await _messageCreator.CreateAsync(message, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<MessageResponseDto>(message);
        }
    }
}
