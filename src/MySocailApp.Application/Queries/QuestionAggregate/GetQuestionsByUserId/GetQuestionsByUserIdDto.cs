﻿using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionAggregate.Get
{
    public class GetQuestionsByUserIdDto(int userId, int offset, int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
