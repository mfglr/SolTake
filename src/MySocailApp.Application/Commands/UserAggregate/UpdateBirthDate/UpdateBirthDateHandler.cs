using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBirthDate
{
    public class UpdateBirthDateHandler(IAccessTokenReader accessTokenReader, IAppUserWriteRepository userRepository, IUnitOfWork unitOfWork) : IRequestHandler<UpdateBirthDateDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserWriteRepository _userRepository = userRepository;
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
