
<div class="row">
    <div class="col-lg-12 text-center "><h1 > {{translate('Country_List')}}
    </h1></div>
    <div class="col-lg-12">

    <table>
        <thead>
            <tr>
                <th>{{ translate('Filter_Criteria') }}</th>
                <th></th>
                <th>

                    {{ translate('Search_Bar_Content')  }}: {{ $data['search'] ?? translate('N/A') }}

                </th>
                <th> </th>
                </tr>


        <tr>
            <th>{{ translate('sl') }}</th>
            <th>{{ translate('Country_Name') }}</th>
            <th>{{ translate('Country_ID') }}</th>
            <th>{{ translate('Total_Cities') }}</th>
            <th>{{ translate('Total_Professionalmen') }}</th>
            <th>{{ translate('Status') }}</th>

        </thead>
        <tbody>
        @foreach($data['data'] as $key => $addon)
            <tr>
        <td>{{ $loop->index+1}}</td>
        <td>{{ $addon->name }}</td>
        <td>{{ $addon->id }}</td>
        <td>
            {{ $addon->cities_count }}
        </td>
        <td>

            {{ $addon->deliverymen_count }}
        </td>
        <td>{{ $addon?->status == 1 ? translate('Active') : translate('Inactive') }}</td>

            </tr>
        @endforeach
        </tbody>
    </table>
    </div>
</div>
