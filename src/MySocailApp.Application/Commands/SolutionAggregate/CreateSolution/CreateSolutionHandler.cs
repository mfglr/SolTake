using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Application.Services.BlobService;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(SolutionCreatorDomainService solutionCreator, IUnitOfWork unitOfWork, IMapper mapper, IAccountAccessor accountAccessor, ISolutionWriteRepository writeRepository, IQuestionReadRepository questionRepository, IBlobService blobService) : IRequestHandler<CreateSolutionDto, SolutionResponseDto>
    {
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly ISolutionWriteRepository _writeRepository = writeRepository;
        private readonly IQuestionReadRepository _questionRepository = questionRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<SolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            var question =
                await _questionRepository.GetAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionIsNotFoundException();

            var images = (await _blobService.UploadAsync(ContainerName.SolutionImages, request.Images,cancellationToken)).Select(x => SolutionImage.Create(x.BlobName,x.Dimention.Height,x.Dimention.Width));

            var solution = new Solution();
            _solutionCreator.Create(_accountAccessor.Account,question,solution,request.Content,images);
            await _writeRepository.CreateAsync(solution, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<SolutionResponseDto>(solution);
        }
    }
}
