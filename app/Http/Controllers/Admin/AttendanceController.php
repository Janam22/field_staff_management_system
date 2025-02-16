<?php

namespace App\Http\Controllers\Admin;

use App\Models\AttendanceLog;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class AttendanceController extends Controller
{
    public function check_in(Request $request)
    {        
        $request->validate([
            'ci_lat' => 'required',
            'ci_lon' => 'required',
        ]);
        $user_id = auth('admin')->user()->id;
        $attendance_log = [
            'emp_id' => $user_id,
            'checkin_time' => now(),
            'ci_lat' => $request->ci_lat,
            'ci_lon' => $request->ci_lon,
            'created_at' => now(),
            'updated_at' => now()
        ];
        DB::table('attendance_logs')->insert($attendance_log);
        return response()->json([
            'status' => 'success',
            'message' => translate('messages.checked_in_successful')
        ]);
    }

    public function check_out(Request $request)
    {
        $request->validate([
            'co_lat' => 'required',
            'co_lon' => 'required',
        ]);

        $user_id = auth('admin')->user()->id;    
        $today = Carbon::today(); // Get today's date

        // Find today's check-in record for the user
        $att = AttendanceLog::where('emp_id', $user_id)
            ->whereDate('checkin_time', $today) // Ensure check-in was today
            ->first();

        if (!$att) {
            return response()->json([
                'status' => 'error',
                'message' => translate('messages.no_checkin_found_for_today')
            ], 400);
        }

        $att->checkout_time = now();
        $att->co_lat = $request->co_lat;
        $att->co_lon = $request->co_lon;
        $att->save();
        return response()->json([
            'status' => 'success',
            'message' => translate('messages.checked_out_successful')
        ]);
    }

}
