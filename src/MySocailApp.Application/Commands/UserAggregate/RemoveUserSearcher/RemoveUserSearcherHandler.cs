using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveUserSearcher
{
    public class RemoveUserSearcherHandler(IAppUserWriteRepository userWriteRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<RemoveUserSearcherDto>
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveUserSearcherDto request, CancellationToken cancellationToken)
        {
            var searcherId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userWriteRepository.GetWithSearcherByIdAsync(request.SearchedId, searcherId, cancellationToken) ??
                throw new UserNotFoundException();

            user.RemoveSearcher(searcherId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
