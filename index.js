const express = require('express')
const app = express();
var bodyParser = require('body-parser')
// set the view engine to ejs
app.set('view engine', 'ejs');
app.use('/adminAssets',express.static('views/adminAssets'));
var session = require('express-session');
var flash = require('req-flash');
app.use(session({secret: 'ssshhhhh',resave: false,saveUninitialized: true}));
app.use(flash());
var urlencodedParser = bodyParser.urlencoded({ extended: false });

const routes = require('./controller/LoginController');
const logicRoutes = require('./controller/logisticsController');
app.get('/admin', routes);
app.get('/logistics', logicRoutes);
app.get('/logisticsDashboard', logicRoutes);
app.post('/validate',urlencodedParser,routes);
app.get('/dashboard',routes);
// Product Route 
const productroutes = require('./controller/ProductController');
app.get('/products/add',productroutes);
app.post('/send/data', urlencodedParser,productroutes);
app.get('/products',productroutes);
// Country Route
const countryroutes = require('./controller/LocationController');
app.get('/country/add',countryroutes);
app.get('/country/edit/:id',countryroutes);
app.post('/country/data',countryroutes);
app.get('/country',countryroutes);
// State Route
app.get('/state/add',countryroutes);
app.get('/state/edit/:id',countryroutes);
app.post('/state/data',countryroutes);
app.get('/state',countryroutes);
// Flock Route
const flockroute = require('./controller/FlockController');
app.get('/flock/add',flockroute);
app.post('/flock/data',flockroute);
app.get('/flock',flockroute);
app.get('/flock/edit/:id',flockroute);
app.get('/flock/delete/:id',flockroute);
//FARM ROUTE
const farmroute = require('./controller/FarmController');
app.get('/farm/add',farmroute);
app.post('/farm/data',farmroute);
app.get('/farm',farmroute);
app.get('/farm/edit/:id',farmroute);
//FARMER ROUTE
const farmerroute = require('./controller/FarmerController');
app.get('/farmer/add',farmerroute);
app.post('/farmer/data',farmerroute);
app.get('/farmer',farmerroute);
app.get('/farmer/edit/:id',farmerroute);
app.listen(8000)