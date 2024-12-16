using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBiography
{
    public class UpdateBiographyHandler(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<UpdateBiographyDto>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(UpdateBiographyDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var user = await _userWriteRepository.GetByIdAsync(accountId, cancellationToken);
            user.UpdateBiography(new Biography(request.Biography));
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
