using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.CommentAggregate.Create
{
    public class CreateCommentHandler(ICommentWriteRepository writeRepository, ICommentReadRepository readRepository, IUnitOfWork unitOfWork, IMapper mapper, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentWriteRepository _writeRepository = writeRepository;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ICommentReadRepository _readRepository = readRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = new Content(request.Content);
            var comment = new Comment();
            await _commentCreator.CreateAsync(comment, userId, content, request.QuestionId, request.SolutionId, request.ParentId, cancellationToken);
            await _writeRepository.CreateAsync(comment, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<CommentResponseDto>(
                await _readRepository.GetByIdAsync(comment.Id, cancellationToken)
            );
        }
    }
}
