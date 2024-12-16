using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateLanguage
{
    public class UpdateLanguageHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdateLanguageDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateLanguageDto request, CancellationToken cancellationToken)
        {
            var language = new Language(request.Language);
            _accountAccessor.Account.UpdateLanguage(language);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
