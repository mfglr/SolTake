using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.VerifyEmail
{
    public class VerifyEmailHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<VerifyEmailDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(VerifyEmailDto request, CancellationToken cancellationToken)
        {
            try
            {
                _userAccessor.User.VerifyEmail(request.Token);
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
