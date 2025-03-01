﻿using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionsByQuestionId
{
    public class GetSolutionsByQuestionIdDto(int questionId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<SolutionResponseDto>>
    {
        public int QuestionId { get; private set; } = questionId;
    }
}
