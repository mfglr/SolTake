using Microsoft.AspNetCore.Mvc;
using MySocailApp.Application.Commands.AccountAggregate.ResetPassword;

namespace MySocailApp.Api.Controllers
{
    [Route("[controller]")]
    public class ResetPasswordController : Controller
    {
        [HttpGet("{email}/{token}")]
        public IActionResult Index(string email,string token)
            => View(new ResetPasswordDto(token,email,"",""));

        [HttpGet("en")]
        public IActionResult English() => View();
    }
}
