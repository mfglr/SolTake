using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class AccountCreatorByThirdPartyDomainService(IAppUserWriteRepository userWriteRepository, IPrivacyPolicyReadRepository policyReadRepository, ITransactionCreator transactionCreator, UserManager<Account> userManager, ITokenProviderOptions tokenProviderOptions, ITermsOfUseReadRepository termsOfUserReadRepository)
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUserReadRepository = termsOfUserReadRepository;
        private readonly ITransactionCreator _transactionCreator = transactionCreator;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task CreateAsync(Account account, string provider, string userId, CancellationToken cancellationToken)
        {

            var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

            //create account
            account.Create();
            var result = await _userManager.CreateAsync(account);
            if (!result.Succeeded) throw new ServerSideException();

            //set last policy
            var policy = await _policyReadRepository.GetLastPolicyAsync(cancellationToken);
            account.AddPolicy(policy.Id);

            //set last termsOfUse
            var termsOfUse = await _termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            account.AddTermOfUse(termsOfUse.Id);

            //create user
            var user = new AppUser(account.Id);
            user.Create();
            await _userWriteRepository.CreateAsync(user, cancellationToken);

            //add role to account
            result = await _userManager.AddToRoleAsync(account, Roles.USER);
            if (!result.Succeeded) throw new ServerSideException();

            //add login to account
            result = await _userManager.AddLoginAsync(account, new(provider, userId, null));
            if (!result.Succeeded) throw new ServerSideException();

            await transaction.CommitAsync(cancellationToken);

            await TokenUpdaterDomainService.UpdateAsync(account, _userManager, _tokenProviderOptions);
        }
    }
}
