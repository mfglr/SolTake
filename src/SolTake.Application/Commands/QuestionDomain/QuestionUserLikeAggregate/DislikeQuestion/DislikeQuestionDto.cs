﻿using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.DislikeQuestion
{
    public record DislikeQuestionDto(int QuestionId) : IRequest;
}
