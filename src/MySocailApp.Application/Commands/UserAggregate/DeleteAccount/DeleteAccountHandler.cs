using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.Commands.UserAggregate.DeleteAccount
{
    public class DeleteAccountHandler(IPublisher publisher, IUserAccessor userAccessor, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<DeleteAccountDto>
    {
        private readonly IPublisher _publisher = publisher;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteAccountDto request, CancellationToken cancellationToken)
        {
            _userWriteRepository.Delete(_userAccessor.User);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new UserDeletedDomainEvent(_userAccessor.User), cancellationToken);
        }
    }
}
