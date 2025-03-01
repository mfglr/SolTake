using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveUserSearcher
{
    public class RemoveUserSearcherHandler(IUserWriteRepository userWriteRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<RemoveUserSearcherDto>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
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
