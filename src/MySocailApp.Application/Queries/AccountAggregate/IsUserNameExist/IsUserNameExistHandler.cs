using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Queries.UserAggregate.IsUserNameExist
{
    public class IsUserNameExistHandler(UserManager<Account> userManager) : IRequestHandler<IsUserNameExistDto, bool>
    {
        private readonly UserManager<Account> _userManager = userManager;

        public Task<bool> Handle(IsUserNameExistDto request, CancellationToken cancellationToken)
            => _userManager.Users.AnyAsync(x => x.UserName!.ToLower() == request.UserName.ToLower(),cancellationToken);
    }
}
