<?php

namespace App\Models;

use CodeIgniter\Model;

class TechnicianModel extends Model
{
    protected $table = 'technician';
    protected $primaryKey = 'id';
    protected $allowedFields = ['email', 'password'];
    protected $useTimestamps = true;
}