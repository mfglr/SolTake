using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBirthDate
{
    public class UpdateBirthDateHandler(IAccessTokenReader accessTokenReader, IAppUserRepository userRepository, IUnitOfWork unitOfWork) : IRequestHandler<UpdateBirthDateDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateBirthDateDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetByIdAsync(userId, cancellationToken) ??
                throw new UserIsNotFoundException();
            user.UpdateBirthDate(request.BirthDate);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
