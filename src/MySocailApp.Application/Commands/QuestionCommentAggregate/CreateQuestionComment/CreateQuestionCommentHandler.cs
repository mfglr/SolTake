using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.QuestionCommentAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;
using MySocailApp.Domain.QuestionCommentAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.CreateQuestionComment
{
    public class CreateQuestionCommentHandler(IQuestionCommentWriteRepository writeRepository, IQuestionCommentReadRepository readRepository, IUnitOfWork unitOfWork, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateQuestionCommentDto, QuestionCommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionCommentWriteRepository _writeRepository = writeRepository;
        private readonly IQuestionCommentReadRepository _readRepository = readRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<QuestionCommentResponseDto> Handle(CreateQuestionCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = new Content(request.Content);
            var comment = new QuestionComment();
            
            comment.Create(userId,request.QuestionId,content);
            await _writeRepository.CreateAsync(comment, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<QuestionCommentResponseDto>(
                await _readRepository.GetByIdAsync(comment.Id,cancellationToken)
            );
        }
    }
}
