using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.UserAggregate.Block
{
    public class BlockHandler(IAppUserWriteRepository userRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<BlockDto>
    {
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(BlockDto request, CancellationToken cancellationToken)
        {
            int userId = _accessTokenReader.GetRequiredAccountId();

            var userToBlock = 
                await _userRepository.GetWithAllAsync(request.BlockedId,userId,cancellationToken) ??
                throw new UserNotFoundException();
            userToBlock.Block(userId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
