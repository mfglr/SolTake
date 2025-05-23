using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.ResetPassword
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
