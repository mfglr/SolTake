using Microsoft.AspNetCore.Mvc;

namespace MySocailApp.Api.Controllers
{
    [Route("[controller]")]
    public class PrivacyPolicyController : Controller
    {
        public IActionResult Index() => View();

        [HttpGet("en")]
        public IActionResult English() => View();
    }
}
