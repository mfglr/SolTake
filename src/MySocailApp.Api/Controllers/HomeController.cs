using Microsoft.AspNetCore.Mvc;

namespace MySocailApp.Api.Controllers
{
    [Route("/")]
    public class HomeController : Controller
    {
        public IActionResult Index() => View();
    }
}
