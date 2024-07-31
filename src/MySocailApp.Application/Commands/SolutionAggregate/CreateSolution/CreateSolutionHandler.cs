using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(SolutionCreatorDomainService solutionCreator, IUnitOfWork unitOfWork, IMapper mapper, IAccessTokenReader tokenReader, ISolutionWriteRepository writeRepository, IBlobService blobService, ISolutionReadRepository readRepository) : IRequestHandler<CreateSolutionDto, SolutionResponseDto>
    {
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _writeRepository = writeRepository;
        private readonly IBlobService _blobService = blobService;
        private readonly ISolutionReadRepository _readRepository = readRepository;

        public async Task<SolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();

            var images = (await _blobService.UploadAsync(ContainerName.SolutionImages, request.Images, cancellationToken)).Select(x => SolutionImage.Create(x.BlobName, x.Dimention.Height, x.Dimention.Width));

            var solution = new Solution();
            await _solutionCreator.CreateAsync(solution, userId, request.QuestionId, request.Content, images, cancellationToken);
            await _writeRepository.CreateAsync(solution, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<SolutionResponseDto>(
                await _readRepository.GetByIdAsync(solution.Id,cancellationToken)
            );
        }
    }
}
