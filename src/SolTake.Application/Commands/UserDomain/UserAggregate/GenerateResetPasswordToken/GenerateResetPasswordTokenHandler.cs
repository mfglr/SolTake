using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.GenerateResetPasswordToken
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
