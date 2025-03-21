<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeaveRequest extends Model
{
    use HasFactory;
    
    public function employee()
    {
        return $this->belongsTo(Admin::class, 'emp_id');
    }

}
