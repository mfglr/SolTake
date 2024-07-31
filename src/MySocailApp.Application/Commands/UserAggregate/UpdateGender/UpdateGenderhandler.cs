using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateGender
{
    public class UpdateGenderhandler(IAccessTokenReader accessTokenReader, IAppUserWriteRepository userRepository, IUnitOfWork unitOfWork) : IRequestHandler<UpdateGenderDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateGenderDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetByIdAsync(userId, cancellationToken) ??
                throw new UserIsNotFoundException();
            user.UpdateGender((Gender)request.Gender);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
