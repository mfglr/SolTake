using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserAggregate.DomainServices
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
