﻿using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.CommentUserLikeAggregate.Abstracts;

namespace SolTake.Infrastructure.CommentDomain.CommentUserLikeAggregate
{
    internal class CommentUserLikeReadRepository(AppDbContext context) : ICommentUserLikeReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int commentId, int userId, CancellationToken cancellationToken)
            => _context.CommentUserLikes.AnyAsync(x => x.CommentId == commentId && x.UserId == userId, cancellationToken);
    }
}
