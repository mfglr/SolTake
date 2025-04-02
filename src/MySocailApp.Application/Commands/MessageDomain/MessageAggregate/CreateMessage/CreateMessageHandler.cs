using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage
{
    public class CreateMessageHandler(IUnitOfWork unitOfWork, IMultimediaService multimediaService, IBlobService blobService, IMessageWriteRepository messageWriteRepository, IUserAccessor userAccessor, IUserReadRepository userReadRepository) : IRequestHandler<CreateMessageDto, CreateMessageResponseDto>
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;

        public async Task<CreateMessageResponseDto> Handle(CreateMessageDto request, CancellationToken cancellationToken)
        {

            if (!await _userReadRepository.Exist(request.ReceiverId, cancellationToken))
                throw new ReceiverNotFoundException();

            IEnumerable<Multimedia>? medias = null;
            try
            {
                if (request.Medias != null)
                    medias = await _multimediaService.UploadAsync(ContainerName.MessageMedias, request.Medias, cancellationToken);

                var content = request.Content != null ? new MessageContent(request.Content) : null;
                var message = new Message(_userAccessor.User.Id, request.ReceiverId, content, medias);
                message.Create(_userAccessor.User.UserName.Value,_userAccessor.User.Image);
                await _messageWriteRepository.CreateAsync(message, cancellationToken);

                await _unitOfWork.CommitAsync(cancellationToken);

                return new(message, _userAccessor.User);
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
