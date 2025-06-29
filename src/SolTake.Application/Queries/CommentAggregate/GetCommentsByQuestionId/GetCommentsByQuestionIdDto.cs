﻿using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentsByQuestionId
{
    public record GetCommentsByQuestionIdDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<CommentResponseDto>>;
}
