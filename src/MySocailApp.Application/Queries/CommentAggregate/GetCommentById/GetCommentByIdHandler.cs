using AutoMapper;
using MediatR;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentById
{
    public class GetCommentByIdHandler(ICommentReadRepository repository, IMapper mapper) : IRequestHandler<GetCommentByIdDto, CommentResponseDto>
    {
        private readonly ICommentReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<CommentResponseDto> Handle(GetCommentByIdDto request, CancellationToken cancellationToken)
        {
            var comment = await _repository.GetByIdAsync(request.Id, cancellationToken);
            return _mapper.Map<CommentResponseDto>(comment);
        }
    }
}
