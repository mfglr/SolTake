using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.CommentAggregate.Create
{
    public class CreateCommentHandler(ICommentWriteRepository commentWriteRepository, ICommentReadRepository readRepository, IUnitOfWork unitOfWork, IMapper mapper, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly ICommentReadRepository _commentReadRepository = readRepository;

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = new Content(request.Content);
            var comment = new Comment();
            await _commentCreator.CreateAsync(comment, userId, content, request.QuestionId, request.SolutionId, request.ParentId, cancellationToken);
            await _commentWriteRepository.CreateAsync(comment, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<CommentResponseDto>(
                await _commentReadRepository.GetByIdAsync(comment.Id, cancellationToken)
            );
        }
    }
}
