﻿using MediatR;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.CommentUserLikeAggregate.Abstracts;
using MySocailApp.Domain.CommentUserLikeAggregate.DomainServices;
using MySocailApp.Domain.CommentUserLikeAggregate.Entities;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment
{
    public class CreateCommentLikeHandler(IUnitOfWork unitOfWork, ICommentUserLikeWriteRepository commentUserLikeWriteRepository, CommentUserLikeCreatorDomainService commentUserLikeCreatorDomainService, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateCommentUserLikeDto, CreateCommentUserLikeResponseDto>
    {
        private readonly ICommentUserLikeWriteRepository _commentUserLikeWriteRepository = commentUserLikeWriteRepository;
        private readonly CommentUserLikeCreatorDomainService _commentUserLikeCreatorDomainService = commentUserLikeCreatorDomainService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateCommentUserLikeResponseDto> Handle(CreateCommentUserLikeDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var like = new CommentUserLike(request.CommentId, login.UserId);
            await _commentUserLikeCreatorDomainService.CreateAsync(like, login, cancellationToken);
            await _commentUserLikeWriteRepository.CreateAsync(like, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
            
            return new(like.Id);
        }
    }
}
