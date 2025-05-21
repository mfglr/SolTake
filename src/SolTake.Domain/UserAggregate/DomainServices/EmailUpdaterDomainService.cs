using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace SolTake.Domain.UserAggregate.DomainServices
{
    public class EmailUpdaterDomainService(IUserReadRepository userReadRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task UpdateAsync(User user, string email, CancellationToken cancellationToken)
        {
            var emailValue = new Email(email);
            if (await _userReadRepository.IsEmailTaken(emailValue, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            user.UpdateEmail(emailValue);
        }
    }
}
