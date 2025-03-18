using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub
{
    public class DisconnectMessageHubHandler(IUnitOfWork unitOfWork, IMessageConnectionWriteRepository repository, IUserAccessor userAccessor) : IRequestHandler<DisconnectMessageHubDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DisconnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var connection = 
                await _repository.GetByIdAsync(_userAccessor.User.Id, cancellationToken) ??
                throw new MessageConnectionNotFoundException();
            connection.SetStateAsOfline();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
