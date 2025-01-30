using Microsoft.AspNetCore.Mvc;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("[controller]")]
    [ApiController]
    public class Callback : ControllerBase
    {
        [HttpGet]
        public string? Index([FromQuery]string? code) => code;

    }
}
