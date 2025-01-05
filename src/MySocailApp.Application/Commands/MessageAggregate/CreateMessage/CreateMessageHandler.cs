using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageAggregate.CreateMessage
{
    public class CreateMessageHandler(IAccessTokenReader tokenReader, IUnitOfWork unitOfWork, IMessageQueryRepository messageQueryRepository, MessageCreaterDomainService messageCreator, IMultimediaService multimediaService, IBlobService blobService, IMessageWriteRepository messageWriteRepository) : IRequestHandler<CreateMessageDto, MessageResponseDto>
    {
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly MessageCreaterDomainService _messageCreator = messageCreator;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;

        public async Task<MessageResponseDto> Handle(CreateMessageDto request, CancellationToken cancellationToken)
        {

            IEnumerable<Multimedia>? medias = null;
            try
            {
                if (request.Medias != null)
                    medias = await _multimediaService.UploadAsync(ContainerName.MessageMedias, request.Medias, cancellationToken);

                var messageMedias = medias?.Select(x => new MessageMultimedia(x));
                var senderId = _tokenReader.GetRequiredAccountId();
                var content = request.Content != null ? new MessageContent(request.Content) : null;
                var message = new Message(senderId, request.ReceiverId, content, messageMedias);
                await _messageCreator.CreateAsync(message, cancellationToken);
                await _messageWriteRepository.CreateAsync(message, cancellationToken);

                await _unitOfWork.CommitAsync(cancellationToken);

                return (await _messageQueryRepository.GetMessageByIdAsync(senderId, message.Id, cancellationToken))!;
            }
            catch (Exception)
            {
                if (medias != null)
                {
                    foreach (var media in medias)
                        await _blobService.DeleteAsync(ContainerName.MessageMedias, media.BlobName, cancellationToken);
                }
                throw;
            }

        }
    }
}
