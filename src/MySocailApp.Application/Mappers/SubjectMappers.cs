﻿using AutoMapper;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class SubjectMappers : Profile
    {
        public SubjectMappers()
        {
            CreateMap<Subject, SubjectResponseDto>();
        }
    }
}
