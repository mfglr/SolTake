using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateName
{
    public class UpdateNameHandler(IAppUserWriteRepository userRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<UpdateNameDto>
    {
        private readonly IAppUserWriteRepository _userRepository = userRepository;
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
