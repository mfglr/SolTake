using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.DeleteUser
{
    public class DeleteUserHandler(IPublisher publisher, IUserAccessor userAccessor, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IBalanceRepository balanceRepository) : IRequestHandler<DeleteUserDto>
    {
        private readonly IPublisher _publisher = publisher;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBalanceRepository _balanceRepository = balanceRepository;

        public async Task Handle(DeleteUserDto request, CancellationToken cancellationToken)
        {
            if (await _balanceRepository.HasDept(_userAccessor.User.Id, cancellationToken))
                throw new UserHasDeptException();

            if (await _balanceRepository.HasBalance(_userAccessor.User.Id, cancellationToken))
                throw new UserHasBalanceException();

            _userWriteRepository.Delete(_userAccessor.User);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new UserDeletedDomainEvent(_userAccessor.User), cancellationToken);
        }
    }
}
