using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveUserSearched
{
    public class RemoveUserSearchedHandler(IAppUserWriteRepository userWriteRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<RemoveUserSearchedDto>
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveUserSearchedDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userWriteRepository.GetWithSearchedByIdAsync(userId, request.SearchedId, cancellationToken) ??
                throw new UserNotFoundException();

            user.RemoveSearched(request.SearchedId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
