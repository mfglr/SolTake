﻿using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public record QuestionResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, QuestionState State, bool IsOwner, int AppUserId, string UserName, string? Content, bool IsLiked, bool IsSaved, int NumberOfLikes, int NumberOfComments, int NumberOfSolutions,int NumberOfCorrectSolutions, int NumberOfVideoSolutions, ExamResponseDto Exam, SubjectResponseDto Subject, TopicResponseDto Topic, IEnumerable<QuestionImageResponseDto> Images);
    
}
