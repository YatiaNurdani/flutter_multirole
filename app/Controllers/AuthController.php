<?php

namespace App\Controllers;

use App\Models\ManagerModel;
use App\Models\TechnicianModel;
use CodeIgniter\RESTful\ResourceController;

class AuthController extends ResourceController
{
    protected $format = 'json';

    public function registerManager()
    {
        $model = new ManagerModel();
        $rules = [
            'email' => 'required|valid_email|is_unique[manager.email]',
            'password' => 'required|min_length[6]',
        ];

        if (!$this->validate($rules)) {
            return $this->fail($this->validator->getErrors());
        }

        $data = [
            'email' => $this->request->getVar('email'),
            'password' => password_hash($this->request->getVar('password'), PASSWORD_BCRYPT),
        ];

        if ($model->save($data)) {
            return $this->respondCreated(['status' => true ,'message' => 'Manager registered successfully']);
        } else {
            return $this->failServerError('Failed to register manager');
        }
    }

    public function registerTechnician()
    {
        $model = new TechnicianModel();
        $rules = [
            'email' => 'required|valid_email|is_unique[technician.email]',
            'password' => 'required|min_length[6]',
        ];

        if (!$this->validate($rules)) {
            return $this->fail($this->validator->getErrors());
        }

        $data = [
            'email' => $this->request->getVar('email'),
            'password' => password_hash($this->request->getVar('password'), PASSWORD_BCRYPT),
        ];

        if ($model->save($data)) {
            return $this->respondCreated(['status' => true ,'message' => 'Technician registered successfully']);
        } else {
            return $this->failServerError('Failed to register technician');
        }
    }

    public function loginManager()
    {
        $model = new ManagerModel();
        $rules = [
            'email' => 'required|valid_email',
            'password' => 'required'
        ];

        if (!$this->validate($rules)) {
            return $this->fail($this->validator->getErrors());
        }

        $user = $model->where('email', $this->request->getVar('email'))->first();

        if (!$user || !password_verify($this->request->getVar('password'), $user['password'])) {
            return $this->failUnauthorized('Invalid email or password');
        }

        $session = session();
        $session->set([
            'userID' => $user['id'],
            'role' => 'manager',
            'isLoggedIn' => true
        ]);

        return $this->respond(['message' => 'Login successful', 'userID' => $user['id'], 'role' => 'manager']);
    }

    public function loginTechnician()
    {
        $model = new TechnicianModel();
        $rules = [
            'email' => 'required|valid_email',
            'password' => 'required'
        ];

        if (!$this->validate($rules)) {
            return $this->fail($this->validator->getErrors());
        }

        $user = $model->where('email', $this->request->getVar('email'))->first();

        if (!$user || !password_verify($this->request->getVar('password'), $user['password'])) {
            return $this->failUnauthorized('Invalid email or password');
        }

        $session = session();
        $session->set([
            'userID' => $user['id'],
            'role' => 'technician',
            'isLoggedIn' => true
        ]);

        return $this->respond(['message' => 'Login successful', 'userID' => $user['id'], 'role' => 'technician']);
    }

    public function logout()
    {
        $session = session();
        $session->destroy();
        return $this->respond(['message' => 'Logout successful']);
    }

    public function getUser()
    {
        $session = session();
        if (!$session->get('isLoggedIn')) {
            return $this->failUnauthorized('User not logged in');
        }

        $role = $session->get('role');
        if ($role == 'manager') {
            $model = new ManagerModel();
        } else {
            $model = new TechnicianModel();
        }

        $user = $model->find($session->get('userID'));
        return $this->respond($user);
    }
}