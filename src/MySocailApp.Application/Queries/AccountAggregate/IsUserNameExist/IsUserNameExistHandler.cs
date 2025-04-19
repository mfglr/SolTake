using MediatR;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Queries.UserAggregate.IsUserNameExist
{
    public class IsUserNameExistHandler(IUserReadRepository userReadRepository) : IRequestHandler<IsUserNameExistDto, bool>
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public Task<bool> Handle(IsUserNameExistDto request, CancellationToken cancellationToken)
            => _userReadRepository.UserNameExist(new(request.UserName), cancellationToken);
    }
}
