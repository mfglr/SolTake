using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MySocailApp.Api.Controllers
{
    [Route("")]
    [ApiController]
    public class Greetings : ControllerBase
    {
        [HttpGet]
        public string SayHi() => "Hi";
    }
}
