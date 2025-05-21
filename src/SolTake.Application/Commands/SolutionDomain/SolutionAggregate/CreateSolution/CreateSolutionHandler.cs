using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.DomainEvents;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.Exceptions;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Core;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, IMultimediaService multimediaService, IAccessTokenReader accessTokenReader, IQuestionReadRepository questionReadRepository, IUserUserBlockRepository userUserBlockRepository, IPublisher publisher) : IRequestHandler<CreateSolutionDto, CreateSolutionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly IPublisher _publisher = publisher;

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var question =
                await _questionReadRepository.GetAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(question.UserId, login.UserId, cancellationToken))
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(login.UserId, question.UserId, cancellationToken))
                throw new UserBlockedException();

            IEnumerable<Multimedia> medias = [];
            try
            {
                medias = await _multimediaService.UploadAsync(ContainerName.SolutionMedias, request.Images, cancellationToken);
                var content = request.Content != null ? new SolutionContent(request.Content) : null;
                var solution = new Solution(request.QuestionId, login.UserId, content, medias);
                solution.Create();
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);
                await _unitOfWork.CommitAsync(cancellationToken);

                await _publisher.Publish(new SolutionCreatedDomainEvent(question, solution, login), cancellationToken);

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
