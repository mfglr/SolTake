using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.MakeProfilePrivate
{
    public class MakeProfilePrivateHandler(IAppUserRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<MakeProfilePrivateDto>
    {
        private readonly IAppUserRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MakeProfilePrivateDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user = await _repository.GetByIdAsync(userId, cancellationToken) ?? throw new UserIsNotFoundException();
            user.MakeProfilePrivate();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
