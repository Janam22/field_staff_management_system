<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\Newsletter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Pagination\Paginator;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\SubscriberListExport;

class CustomerController extends Controller
{
    public function subscribedCustomers(Request $request)
    {
        $show_limit =  $request->show_limit ?? null;
        $customers = $this->getSubscribersMail($request);
        if (isset($show_limit) && $show_limit > 0) {
            $customers = $customers->take($show_limit)->get();
            $perPage = config('default_pagination');
            $page =  $request?->page ?? 1;
            $offset = ($page - 1) * $perPage;
            $itemsForCurrentPage = $customers->slice($offset, $perPage);
            $customers = new \Illuminate\Pagination\LengthAwarePaginator(
                $itemsForCurrentPage,
                $customers->count(),
                $perPage,
                $page,
                ['path' => Paginator::resolveCurrentPath(), 'query' => request()->query()]
            );
        } else {
            $customers = $customers->paginate(config('default_pagination'));
        }
        $subscribers = $customers;

        return view('admin-views.customer.subscriber.list', compact('subscribers'));
    }


    public function subscribed_customer_export(Request $request)
    {
        $show_limit =  $request->show_limit ?? null;
        $customers = $this->getSubscribersMail($request);
        if (isset($show_limit) && $show_limit > 0) {
            $customers = $customers->take($show_limit)->get();
        } else {
            $customers = $customers->get();
        }

        $data = [
            'customers' => $customers,
            'subscription_date' => $request?->join_date,
            'chose_first'=>  $show_limit ,
            'search'=>  $request->search ,
            'filter'=>  $request->filter ? translate('messages.Sort by').' '.$request->filter  : null ,

        ];

        if ($request->type == 'excel') {
            return Excel::download(new SubscriberListExport($data), 'Subscribers.xlsx');
        } else if ($request->type == 'csv') {
            return Excel::download(new SubscriberListExport($data), 'Subscribers.csv');
        }
    }

    private function getSubscribersMail($request)
    {
        $filter =  $request->filter ?? null;
        $join_date_start = null;
        $join_date_end = null;
        if ($request?->join_date) {
            list($join_date_start, $join_date_end) = explode(' - ', $request?->join_date);
            $join_date_start = Carbon::createFromFormat('m/d/Y', $join_date_start)->startOfDay();
            $join_date_end = Carbon::createFromFormat('m/d/Y', $join_date_end)->endOfDay();
        }
        $key = explode(' ', $request['search']);
        $customers = Newsletter::when(isset($key), function ($query) use ($key) {
            $query->where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('email', 'like', "%" . $value . "%");
                }
            });
        })
            ->when(isset($request->join_date), function ($query) use ($join_date_start, $join_date_end) {
                $query->WhereBetween('created_at', [$join_date_start, $join_date_end]);
            });


        if (isset($filter) && $filter == 'oldest') {
            $customers = $customers->oldest();
        } else {
            $customers = $customers->latest();
        }

        return $customers;
    }

}
