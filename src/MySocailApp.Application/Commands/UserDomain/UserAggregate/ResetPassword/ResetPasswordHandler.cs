using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.ResetPassword
{
    public class ResetPasswordHandler(IUnitOfWork unitOfWork, IUserWriteRepository userWriteRepository) : IRequestHandler<ResetPasswordDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task Handle(ResetPasswordDto request, CancellationToken cancellationToken)
        {
            var email = new Email(request.Email);
            var password = new Password(request.Password);
            var passwordConfirm = new Password(request.PasswordConfirm);

            var user =
                await _userWriteRepository.GetByEmailAsync(email, cancellationToken) ??
                throw new UserNotFoundException();

            try
            {
                user.ResetPassword(request.Token, password, passwordConfirm);
            }
            catch (InvalidTokenException)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
                throw;
            }

            await _unitOfWork.CommitAsync(cancellationToken);

        }
    }
}
