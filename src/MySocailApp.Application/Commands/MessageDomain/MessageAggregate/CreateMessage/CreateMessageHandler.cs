using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage
{
    public class CreateMessageHandler(IUnitOfWork unitOfWork, IMultimediaService multimediaService, IBlobService blobService, IMessageWriteRepository messageWriteRepository, IUserReadRepository userReadRepository, MessageCreatorDomainService messageCreatorDomainService, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateMessageDto, CreateMessageResponseDto>
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly MessageCreatorDomainService _messageCreatorDomainService = messageCreatorDomainService;

        public async Task<CreateMessageResponseDto> Handle(CreateMessageDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            if (!await _userReadRepository.Exist(request.ReceiverId, cancellationToken))
                throw new ReceiverNotFoundException();

            IEnumerable<Multimedia>? medias = null;
            try
            {
                if (request.Medias != null)
                    medias = await _multimediaService.UploadAsync(ContainerName.MessageMedias, request.Medias, cancellationToken);

                var content = request.Content != null ? new MessageContent(request.Content) : null;
                var message = new Message(login.UserId, request.ReceiverId, content, medias);
                await _messageCreatorDomainService.CreateAsync(message, login, cancellationToken);
                await _messageWriteRepository.CreateAsync(message, cancellationToken);

                await _unitOfWork.CommitAsync(cancellationToken);

                return new(message, login);
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
