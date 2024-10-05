using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Domain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageImage
{
    public class GetMessageImageHandler(IMessageReadRepository messageReadRepository, IBlobService blobService, IAccessTokenReader accessTokenReader) : IRequestHandler<GetMessageImageDto, byte[]>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<byte[]> Handle(GetMessageImageDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            
            var message =
                await _messageReadRepository.GetMessageWithImagesAsync(accountId, request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (accountId != message.SenderId && accountId != message.ReceiverId)
                throw new PermissionDeniedToAccessMessageImage();
            
            if(request.Index < 0 || request.Index >= message.Images.Count)
                throw new MessageImageNotFoundException();

            var image = message.Images[request.Index];
            return await _blobService.ReadAsync(ContainerName.MesssageImages, image.BlobName);
        }
    }
}
