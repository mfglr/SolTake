using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBiography
{
    public class UpdateBiographyHandler(IAppUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<UpdateBiographyDto>
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(UpdateBiographyDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var user = await _userWriteRepository.GetByIdAsync(accountId, cancellationToken);
            user.Biography = new Biography(request.Biography);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
