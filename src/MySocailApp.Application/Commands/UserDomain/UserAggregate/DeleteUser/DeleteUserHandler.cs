using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.DeleteUser
{
    public class DeleteUserHandler(IPublisher publisher, IUserAccessor userAccessor, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<DeleteUserDto>
    {
        private readonly IPublisher _publisher = publisher;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteUserDto request, CancellationToken cancellationToken)
        {
            _userWriteRepository.Delete(_userAccessor.User);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new UserDeletedDomainEvent(_userAccessor.User), cancellationToken);
        }
    }
}
