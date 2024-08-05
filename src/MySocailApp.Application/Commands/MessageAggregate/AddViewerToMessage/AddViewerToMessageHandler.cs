using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessage
{
    public class AddViewerToMessageHandler(IMessageWriteRepository repository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader) : IRequestHandler<AddViewerToMessageDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task Handle(AddViewerToMessageDto request, CancellationToken cancellationToken)
        {
            var viewerId = _tokenReader.GetRequiredAccountId();
            var message =
                await _repository.GetById(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();
            message.MarkAsViewed(viewerId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
