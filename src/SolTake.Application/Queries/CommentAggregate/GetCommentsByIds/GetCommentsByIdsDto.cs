﻿using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByIds
{
    public record GetCommentsByIdsDto(IEnumerable<int> Ids) : IRequest<List<CommentResponseDto>>;
}
