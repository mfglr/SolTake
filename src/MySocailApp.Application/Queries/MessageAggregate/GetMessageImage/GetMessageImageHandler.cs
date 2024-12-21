using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageImage
{
    public class GetMessageImageHandler(IMessageReadRepository messageReadRepository, IBlobService blobService, IAccessTokenReader accessTokenReader) : IRequestHandler<GetMessageImageDto, Stream>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Stream> Handle(GetMessageImageDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            
            var message =
                await _messageReadRepository.GetMessageWithImagesAsync(accountId, request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (accountId != message.SenderId && accountId != message.ReceiverId)
                throw new PermissionDeniedToAccessMessageImage();
            
            if(request.Index < 0 || request.Index >= message.Medias.Count)
                throw new MessageImageNotFoundException();

            var image = message.Medias[request.Index];
            return await _blobService.ReadAsync(ContainerName.MesssageImages, image.BlobName, cancellationToken);
        }
    }
}
