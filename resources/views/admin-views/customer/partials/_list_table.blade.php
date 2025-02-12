@foreach($orders as $key=>$order)
<tr>
    <td>{{$key+$orders->firstItem()}}</td>
    <td class="table-column-pl-0 text-center">
        <a href="{{route('admin.order.details',['id'=>$order['id']])}}">{{$order['id']}}</a>
    </td>
    <td class="text-capitalize text-center">
        @if($order['order_status']=='pending')
            <span class="badge badge-soft-info mb-1">
                                      {{translate('messages.pending')}}
                                    </span>
        @elseif($order['order_status']=='accepted')
            <span class="badge badge-soft-info mb-1">
                                      {{translate('messages.accepted')}}
                                    </span>
        @elseif($order['order_status']=='confirmed')
            <span class="badge badge-soft-info mb-1">
                                      {{translate('messages.confirmed')}}
                                    </span>
        @elseif($order['order_status']=='completed')
            <span class="badge badge-soft-success mb-1">
                                      {{translate('messages.completed')}}
                                    </span>
        @elseif($order['order_status']=='failed')
            <span class="badge badge-soft-danger mb-1">
                                      {{translate('messages.payment_failed')}}
                                    </span>
        @else
            <span class="badge badge-soft-danger mb-1">
                                      {{translate(str_replace('_',' ',$order['order_status']))}}
                                    </span>
        @endif
    </td>
    <td>
        <div class="text-center">
            {{\App\CentralLogics\Helpers::format_currency($order['order_amount'])}}
        </div>
    </td>
    <td>
        <div class="btn--container justify-content-center">
        <a class="btn btn-sm btn--warning btn-outline-warning action-btn"
                    href="{{route('admin.order.details',['id'=>$order['id']])}}" title="{{translate('messages.view')}}"><i
                            class="tio-visible-outlined"></i></a>
        </div>
    </td>
</tr>
@endforeach
