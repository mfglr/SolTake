using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.MakeProfilePublic
{
    public class MakeProfilePublicCommandHandler(IAppUserRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<MakeProfilePublicDto>
    {
        private readonly IAppUserRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MakeProfilePublicDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();

            var user = 
                await _repository.GetWithRequestersById(userId, cancellationToken) ?? 
                throw new UserIsNotFoundException();
            user.MakeProfilePublic();

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
