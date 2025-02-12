<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function dashboard(Request $request)
    {
        $params = [
            'zone_id' => $request['zone_id'] ?? 'all',
            'statistics_type' => $request['statistics_type'] ?? 'overall',
            'user_overview' => $request['user_overview'] ?? 'overall',
            'business_overview' => $request['business_overview'] ?? 'overall',
        ];
        session()->put('dash_params', $params);
        $data = self::dashboard_data();
        $total_sell = $data['total_sell'];
        $commission = $data['commission'];
        return view('admin-views.dashboard', compact('data', 'total_sell','commission', 'params'));
    }

    public function zone(Request $request)
    {
        $params = session('dash_params');
        foreach ($params as $key => $value) {
            if ($key == 'zone_id') {
                $params['zone_id'] = $request['zone_id'];
            }
        }
        session()->put('dash_params', $params);

        $data = self::dashboard_data();
        $total_sell = $data['total_sell'];
        $commission = $data['commission'];
        $top_professionalman = $data['top_professionalman'];
        $top_customer = $data['top_customer'];
        $top_services = $data['top_services'];

        return response()->json([
            'top_professionalman' => view('admin-views.partials._top-professionalman', compact('top_professionalman'))->render(),
            'top_customer' => view('admin-views.partials._top-customer', compact('top_customer'))->render(),
            'top_services' => view('admin-views.partials._top-services', compact('top_services'))->render(),

            'stat_zone' => view('admin-views.partials._zone-change', compact('data'))->render(),
            'order_stats_top' => view('admin-views.partials._order-statics', compact('data'))->render(),
            'user_overview' => view('admin-views.partials._user-overview-chart', compact('data'))->render(),
            'monthly_graph' => view('admin-views.partials._monthly-earning-graph', compact('total_sell', 'commission'))->render(),
        ], 200);
    }

    public function dashboard_data()
    {
        $params = session('dash_params');

        $top_customer = User::
            when(is_numeric($params['zone_id']), function($q)use($params){
                return $q->where('zone_id', $params['zone_id']);
            })
            ->where('type','zone_wise')
            ->orderBy("order_count", 'desc')
            ->take(6)
            ->get();

        $total_sell = [];
        $commission = [];
        for ($i = 1; $i <= 12; $i++) {

        }

        $dash_data['top_customer'] = $top_customer;
        $dash_data['total_sell'] = $total_sell;
        $dash_data['commission'] = $commission;

        return $dash_data;
    }
}
