using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.StoryDomain.StoryUserViewAggregate.ViewStory;
using SolTake.Application.Queries.StoryDomain;
using SolTake.Application.Queries.StoryDomain.GetStoryUserViewsByStoryId;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class StoryUserViewsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<ViewStoryResponseDto> Create(ViewStoryDto request,CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet("{storyId}")]
        public async Task<List<StoryUserViewResponseDto>> GetStoryUserViewsByStoryId(int storyId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetStoryUserViewsByStoryIdDto(storyId,offset,take,isDescending), cancellationToken);
    }
}
