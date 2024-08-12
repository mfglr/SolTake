using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Queries.UserAggregate.IsUserNameExist
{
    public class IsUserNameExistHandler(UserManager<Account> userManager) : IRequestHandler<IsUserNameExistDto, bool>
    {
        private readonly UserManager<Account> _userManager = userManager;

        public async Task<bool> Handle(IsUserNameExistDto request, CancellationToken cancellationToken)
            => await _userManager.Users.AnyAsync(x => x.UserName == request.UserName);
    }
}
