using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.GenerateResetPasswordToken
{
    public class GenerateResetPasswordTokenHandler(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<GenerateResetPasswordTokenDto>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(GenerateResetPasswordTokenDto request, CancellationToken cancellationToken)
        {
            var email = new Email(request.Email);
            var account =
                await _userWriteRepository.GetByEmailAsync(email, cancellationToken) ??
                throw new UserNotFoundException();

            account.GeneratePasswordResetToken();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
