using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainServices
{
    public class EmailUpdaterDomainService(IUserReadRepository userReadRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task UpdateAsync(User user, string email, CancellationToken cancellationToken)
        {
            var emailValue = new Email(email);
            if (await _userReadRepository.EmailExist(emailValue, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            user.UpdateEmail(emailValue);
        }
    }
}
