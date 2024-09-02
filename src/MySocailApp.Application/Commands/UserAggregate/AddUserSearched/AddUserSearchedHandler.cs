using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Commands.UserAggregate.AddUserSearched
{
    public class AddUserSearchedHandler(IAppUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IMapper mapper) : IRequestHandler<AddUserSearchedDto, AddUserSearchedCommandResponseDto>
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMapper _mapper = mapper;

        public async Task<AddUserSearchedCommandResponseDto> Handle(AddUserSearchedDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userWriteRepository.GetWithSearchedByIdAsync(userId, request.SearchedId, cancellationToken) ??
                throw new UserNotFoundException();
            var search = user.AddSearched(request.SearchedId);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<AddUserSearchedCommandResponseDto>(search);
        }
    }
}
