﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.UserAggregate.Exceptions;

namespace SolTake.Application.Queries.UserDomain.GetUserById
{
    public class GetByIdHandler(IUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUserByIdDto, UserResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserQueryRepository _repository = repository;

        public async Task<UserResponseDto> Handle(GetUserByIdDto request, CancellationToken cancellationToken)
            => await _repository
                .GetByIdAsync(
                    request.Id,
                    _accessTokenReader.GetRequiredAccountId(),
                    cancellationToken
                ) ??
                throw new UserNotFoundException();
    }
}
