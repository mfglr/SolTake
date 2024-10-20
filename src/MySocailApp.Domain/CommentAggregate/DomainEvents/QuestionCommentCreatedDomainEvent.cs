﻿using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record QuestionCommentCreatedDomainEvent(Question Question, Comment Comment) : IDomainEvent;
}
