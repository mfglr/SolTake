using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.BalanceAggregate.Abstracts;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.DeleteUser
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
