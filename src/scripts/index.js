require("materialize-loader");
require('materialize-css/dist/js/materialize.js');
require('./app.tag');
//require('./users.tag');
//require('./user.tag')
//require('./cardpanel.tag');
//require('./dropdown.tag');
require('./urf.tag');
require('./notfound.tag');
require('./login.tag');
require('./logname.tag');

riot.mount('*');

var
    Route = riot.router.Route,
    DefaultRoute = riot.router.DefaultRoute,
   // NotFoundRoute = riot.router.NotFoundRoute,
    RedirectRoute = riot.router.RedirectRoute;
riot.router.routes([
    new Route({path: 'app',tag: 'app'}),
    //new Route({path: 'users',tag: 'users'}),
    new Route({path: 'add',tag: 'urf'}),
    new Route({path: 'login',tag: 'login'}),
    //new DefaultRoute({tag: 'urf'}),
    new RedirectRoute({from: 'h', to: 'urf'}),
    //new NotFoundRoute({tag: 'notfound'})
]);
riot.router.start();