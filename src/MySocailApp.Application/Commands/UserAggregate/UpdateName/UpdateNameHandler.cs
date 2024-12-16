using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateName
{
    public class UpdateNameHandler(IUserWriteRepository userRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<UpdateNameDto>
    {
        private readonly IUserWriteRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateNameDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetByIdAsync(userId, cancellationToken) ??
                throw new UserNotFoundException();
            user.UpdateName(request.Name);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
