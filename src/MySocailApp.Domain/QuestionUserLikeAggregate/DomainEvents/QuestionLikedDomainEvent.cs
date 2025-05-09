﻿using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionLikedDomainEvent(Question Question, QuestionUserLike Like, Login Login) : IDomainEvent;
}
