using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.BlobService.TextService;
using MySocailApp.Core;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;

namespace MySocailApp.Application.Queries.PrivacyPolicyAggregate.GetLastPrivacyPolicy
{
    public class GetLastPrivacyPolicyHandler(ITextService textService, IPrivacyPolicyReadRepository privacyPolicyReadRepository) : IRequestHandler<GetLastPrivacyPolicyDto, Stream>
    {
        private readonly ITextService _textService = textService;
        private readonly IPrivacyPolicyReadRepository _privacyPolicyReadRepository = privacyPolicyReadRepository;

        public async Task<Stream> Handle(GetLastPrivacyPolicyDto request, CancellationToken cancellationToken)
        {
            var language = Languages.GetLanguage(request.Language);
            var policy = await _privacyPolicyReadRepository.GetLastPolicyAsync(cancellationToken);
            string blobName;
            if (language == Languages.TR)
                blobName = policy.BlobNameTr;
            else
                blobName = policy.BlobNameEn;
            return _textService.Read(ContainerName.PrivacyPolicies, blobName);
        }
    }
}
