using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessages
{
    public class AddViewerToMessagesHandler(IMessageWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<AddViewerToMessagesDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(AddViewerToMessagesDto request, CancellationToken cancellationToken)
        {
            var viewerId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _repository.GetByIds(request.Ids, cancellationToken);

            foreach (var message in messages)
                message.AddViewer(viewerId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
