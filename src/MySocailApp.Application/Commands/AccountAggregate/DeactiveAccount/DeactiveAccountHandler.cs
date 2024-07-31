using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Commands.AccountAggregate.DeactiveAccount
{
    public class DeactiveAccountHandler(IAppUserWriteRepository userRepository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, UserManager<Account> userManager) : IRequestHandler<DeactiveAccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(DeactiveAccountDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = await _userManager.FindByIdAsync(accountId.ToString());
            account.Remove();
            var user = (await _userRepository.GetWithAllAsync(account.Id, cancellationToken))!;
            user.Remove();

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
