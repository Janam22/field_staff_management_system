@php($params = session('dash_params'))
@if ($params['zone_id'] != 'all')
    @php($zone_name = \App\Models\Zone::where('id', $params['zone_id'])->first()->name)
@else
@php($zone_name=translate('All'))
@endif
<div class="chartjs-custom mx-auto">
    <div data-id="#user-overview" data-value="{{ $data['customer'].','. $data['professional_man'] }}"
    data-labels="{{translate('messages.Customer')}}, {{ translate('messages.Professional_man') }}"    id="user-overview"></div>
</div>

