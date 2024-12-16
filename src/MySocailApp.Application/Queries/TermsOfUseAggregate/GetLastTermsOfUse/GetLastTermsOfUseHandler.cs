using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;
using MySocailApp.Domain.AccountDomain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Application.Queries.TermsOfUseAggregate.GetLastTermsOfUse
{
    public class GetLastTermsOfUseHandler(ITermsOfUseReadRepository termsOfUserReadRepository, IBlobService blobService) : IRequestHandler<GetLastTermsOfUseDto,Stream>
    {
        private readonly ITermsOfUseReadRepository _termsOfUserReadRepository = termsOfUserReadRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Stream> Handle(GetLastTermsOfUseDto request, CancellationToken cancellationToken)
        {
            var language = new Language(request.Language);
            var termsOfUse = await _termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            string blobName;
            if (language.Value == Languages.TR)
                blobName = termsOfUse.BlobNameTr;
            else
                blobName = termsOfUse.BlobNameEn;
            return await _blobService.ReadAsync(ContainerName.TermsOfUses, blobName, cancellationToken);
        }
    }
}
