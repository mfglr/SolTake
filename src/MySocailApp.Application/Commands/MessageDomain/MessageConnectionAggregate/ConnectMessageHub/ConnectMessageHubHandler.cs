using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub
{
    public class ConnectMessageHubHandler(IUserAccessor userAccessor, IMessageConnectionWriteRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<ConnectMessageHubDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ConnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var connection = await _repository.GetByIdAsync(_userAccessor.User.Id, cancellationToken);
            if (connection == null)
            {
                connection = MessageConnection.Create(_userAccessor.User.Id,request.ConnectionId);
                await _repository.CreateAsync(connection, cancellationToken);
            }
            connection.SetStateAsOnline();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
