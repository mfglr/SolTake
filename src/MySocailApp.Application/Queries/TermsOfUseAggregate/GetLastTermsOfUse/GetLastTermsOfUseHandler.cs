using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.BlobService.TextService;
using MySocailApp.Core;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Application.Queries.TermsOfUseAggregate.GetLastTermsOfUse
{
    public class GetLastTermsOfUseHandler(ITermsOfUseReadRepository termsOfUserReadRepository, ITextService textService) : IRequestHandler<GetLastTermsOfUseDto,Stream>
    {
        private readonly ITermsOfUseReadRepository _termsOfUserReadRepository = termsOfUserReadRepository;
        private readonly ITextService _textService = textService;

        public async Task<Stream> Handle(GetLastTermsOfUseDto request, CancellationToken cancellationToken)
        {
            var language = Languages.GetLanguage(request.Language);
            var termsOfUse = await _termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            string blobName;
            if (language == Languages.TR)
                blobName = termsOfUse.BlobNameTr;
            else
                blobName = termsOfUse.BlobNameEn;
            return _textService.Read(ContainerName.TermsOfUses, blobName);
        }
    }
}
