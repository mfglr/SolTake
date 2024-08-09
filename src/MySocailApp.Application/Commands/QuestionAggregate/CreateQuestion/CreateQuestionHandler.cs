using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IQuestionReadRepository readRepository, IMapper mapper, QuestionCreatorDomainService questionCreator, IBlobService blobService) : IRequestHandler<CreateQuestionDto, QuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly QuestionCreatorDomainService _questionCreator = questionCreator;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _readRepository = readRepository;
        private readonly IMapper _mapper = mapper;
        private readonly IBlobService _blobService = blobService;

        public async Task<QuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();

            var images = (await _blobService.UploadAsync(ContainerName.QuestionImages, request.Images, cancellationToken)).Select(x => QuestionImage.Create(x.BlobName, x.Dimention.Height,x.Dimention.Width));
            
            var question = new Question();
            await _questionCreator.CreateAsync(question, accountId, request.Content, request.ExamId, request.SubjectId, request.TopicIds, images,cancellationToken);
            await _repository.CreateAsync(question, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            var response = _mapper.Map<QuestionResponseDto>(
                await _readRepository.GetQuestionByIdAsync(question.Id, cancellationToken)
            );
            return response;
        }
    }
}
