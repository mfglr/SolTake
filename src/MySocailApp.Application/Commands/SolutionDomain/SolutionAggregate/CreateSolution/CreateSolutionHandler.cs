using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, IMultimediaService multimediaService, IAccessTokenReader accessTokenReader, IQuestionReadRepository questionReadRepository, SolutionCreatorDomainService solutionCreatorDomainService) : IRequestHandler<CreateSolutionDto, CreateSolutionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly SolutionCreatorDomainService _solutionCreatorDomainService = solutionCreatorDomainService;

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var question =
                await _questionReadRepository.GetAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            IEnumerable<Multimedia> medias = [];
            try
            {
                //uploading images
                medias = await _multimediaService.UploadAsync(ContainerName.SolutionMedias, request.Images, cancellationToken);

                //create solution
                var content = request.Content != null ? new SolutionContent(request.Content) : null;
                var solution = new Solution(request.QuestionId, login.UserId, content, medias);
                await _solutionCreatorDomainService.CreateAsync(solution, login, cancellationToken);
                
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return new(solution, login);
            }
            catch (Exception)
            {
                foreach (var media in medias)
                    await _blobService.DeleteAsync(ContainerName.SolutionMedias, media.BlobName, cancellationToken);
                throw;
            }
        }
    }
}
