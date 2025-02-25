<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeaveRequest extends Model
{
    use HasFactory;
    protected $casts = [
        'status' => 'integer', // Ensures it retrieves `0` or `1`
    ];
    
    public function employee()
    {
        return $this->belongsTo(Admin::class, 'emp_id');
    }

}
