using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Delete
{
    public class DeleteUserUserBlockCommandHandler(IUserUserBlockRepository userUserBlockRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteUserUserBlockDto>
    {
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteUserUserBlockDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var block =
                await _userUserBlockRepository.GetAsync(login.UserId, request.BlockedId, cancellationToken) ??
                throw new UserUserBlockNotFouncException();

            _userUserBlockRepository.Delete(block);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
