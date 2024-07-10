<?php
namespace Config;
use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
use App\Controllers\AuthController;
use CodeIgniter\Config\BaseConfig;

$routes = Services::routes();

$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

// Tambahkan rute untuk registrasi
$routes->post('register/manager', 'AuthController::registerManager');
$routes->post('register/technician', 'AuthController::registerTechnician');
$routes->post('login/manager', 'AuthController::loginManager');
$routes->post('login/technician', 'AuthController::loginTechnician');
$routes->post('logout', 'AuthController::logout');
$routes->get('user', 'AuthController::getUser');