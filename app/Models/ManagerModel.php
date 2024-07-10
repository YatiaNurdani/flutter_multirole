<?php

namespace App\Models;

use CodeIgniter\Model;

class ManagerModel extends Model
{
    protected $table = 'manager';
    protected $primaryKey = 'id';
    protected $allowedFields = ['email', 'password'];
    protected $useTimestamps = true;
}