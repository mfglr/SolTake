using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageMedia
{
    public class GetMessageMediaHandler(IMessageReadRepository messageReadRepository, IBlobService blobService, IAccessTokenReader accessTokenReader) : IRequestHandler<GetMessageMediaDto, Stream>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Stream> Handle(GetMessageMediaDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();

            var message =
                await _messageReadRepository.GetMessageWithImagesAsync(accountId, request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (accountId != message.SenderId && accountId != message.ReceiverId)
                throw new PermissionDeniedToAccessMessageImage();

            if (request.Index < 0 || request.Index >= message.Medias.Count)
                throw new MessageImageNotFoundException();

            var image = message.Medias[request.Index];
            return await _blobService.ReadAsync(ContainerName.MessageMedias, image.BlobName, cancellationToken);
        }
    }
}
