using MediatR;
using SolTake.Application.Queries.AccountAggregate.IsUserNameExist;
using SolTake.Domain.UserAggregate.Abstracts;

namespace SolTake.Application.Queries.UserAggregate.IsUserNameExist
{
    public class IsUserNameExistHandler(IUserReadRepository userReadRepository) : IRequestHandler<IsUserNameExistDto, bool>
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public Task<bool> Handle(IsUserNameExistDto request, CancellationToken cancellationToken)
            => _userReadRepository.UserNameExist(new(request.UserName), cancellationToken);
    }
}
