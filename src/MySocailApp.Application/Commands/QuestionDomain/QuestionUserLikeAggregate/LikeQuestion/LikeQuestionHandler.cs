﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionUserLikeAggregate.DomainServices;
using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, QuestionUserLikeCreatorDomainService questionUserLikeCreatorDomainService, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository) : IRequestHandler<LikeQuestionDto, LikeQuestionCommandResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly QuestionUserLikeCreatorDomainService _questionUserLikeCreatorDomainService = questionUserLikeCreatorDomainService;
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;

        public async Task<LikeQuestionCommandResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var like = new QuestionUserLike(request.QuestionId, login.UserId);
            await _questionUserLikeCreatorDomainService.CreateAsync(like, login, cancellationToken);
            await _questionUserLikeWriteRepository.CreateAsync(like, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return new(like, login);
        }
    }
}
