<?php

namespace App\Http\Controllers\Admin;

use App\Traits\Processor;
use App\Models\DataSetting;
use App\Models\Translation;
use Illuminate\Http\Request;
use App\Models\EmailTemplate;
use App\CentralLogics\Helpers;
use App\Models\BusinessSetting;
use Illuminate\Support\Facades\DB;
use App\Models\NotificationSetting;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class BusinessSettingsController extends Controller
{
    use Processor;

    public function business_index($tab = 'business')
    {
        if (!Helpers::module_permission_check('settings')) {
            Toastr::error(translate('messages.access_denied'));
            return back();
        }
        if ($tab == 'business') {
            return view('admin-views.business-settings.business-index');
        }
    }

    public function business_setup(Request $request)
    {

        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
            }

        $validator = Validator::make($request->all(), [
            'logo' => 'nullable|max:2048',
            'icon' => 'nullable|max:2048',
        ]);

        if ($validator->fails()) {
        Toastr::error( translate('Image size must be within 2mb'));
        return back();
        }

        $key =['logo','icon',];
        $settings =  array_column(BusinessSetting::whereIn('key', $key)->get()->toArray(), 'value', 'key');

        BusinessSetting::query()->updateOrInsert(['key' => 'country_picker_status'], [
            'value' => $request['country_picker_status'] ? $request['country_picker_status'] : 0
        ]);
        BusinessSetting::query()->updateOrInsert(['key' => 'business_name'], [
            'value' => $request['restaurant_name']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'timezone'], [
            'value' => $request['timezone']
        ]);

        if ($request->has('logo')) {

            $image_name = Helpers::update( dir: 'business/', old_image:$settings['logo'],format: 'png',image: $request->file('logo'));
        } else {
            $image_name = $settings['logo'];
        }

        BusinessSetting::query()->updateOrInsert(['key' => 'logo'], [
            'value' => $image_name
        ]);

        if ($request->has('icon')) {

            $image_name = Helpers::update( dir: 'business/', old_image:$settings['icon'], format:'png', image: $request->file('icon'));
        } else {
            $image_name = $settings['icon'];
        }

        BusinessSetting::query()->updateOrInsert(['key' => 'icon'], [
            'value' => $image_name
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'phone'], [
            'value' => $request['phone']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'email_address'], [
            'value' => $request['email']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'address'], [
            'value' => $request['address']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'footer_text'], [
            'value' => $request['footer_text']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'cookies_text'], [
            'value' => $request['cookies_text']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'country'], [
            'value' => $request['country']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'default_location'], [
            'value' => json_encode(['lat' => $request['latitude'], 'lng' => $request['longitude']])
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'timeformat'], [
            'value' => $request['time_format']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'digit_after_decimal_point'], [
            'value' => $request['digit_after_decimal_point']
        ]);

        Toastr::success( translate('Successfully updated. To see the changes in app restart the app.'));
        return back();
    }

    public function mail_index()
    {
        return view('admin-views.business-settings.mail-index');
    }

    public function mail_config(Request $request)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }
        BusinessSetting::updateOrInsert(
            ['key' => 'mail_config'],
            [
                'value' => json_encode([
                    "status" => $request['status'],
                    "name" => $request['name'],
                    "host" => $request['host'],
                    "driver" => $request['driver'],
                    "port" => $request['port'],
                    "username" => $request['username'],
                    "email_id" => $request['email'],
                    "encryption" => $request['encryption'],
                    "password" => $request['password']
                ]),
                'updated_at' => now()
            ]
        );
        Toastr::success(translate('messages.configuration_updated_successfully'));
        return back();
    }

    public function mail_config_status(Request $request)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }
        $config = BusinessSetting::where(['key' => 'mail_config'])->first();

        $data = $config ? json_decode($config['value'], true) : null;

        BusinessSetting::updateOrInsert(
            ['key' => 'mail_config'],
            [
                'value' => json_encode([
                    "status" => $request['status'] ?? 0,
                    "name" => $data['name'] ?? '',
                    "host" => $data['host'] ?? '',
                    "driver" => $data['driver'] ?? '',
                    "port" => $data['port'] ?? '',
                    "username" => $data['username'] ?? '',
                    "email_id" => $data['email_id'] ?? '',
                    "encryption" => $data['encryption'] ?? '',
                    "password" => $data['password'] ?? ''
                ]),
                'updated_at' => now()
            ]
        );
        Toastr::success(translate('messages.configuration_updated_successfully'));
        return back();
    }

    public function app_settings()
    {
        return view('admin-views.business-settings.app-settings');
    }

    public function update_landing_page_settings(Request $request, $tab)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }

        if ($tab == 'text') {
            BusinessSetting::query()->updateOrInsert(['key' => 'landing_page_text'], [
                'value' => json_encode([
                    'header_title_1' => $request['header_title_1'],
                    'header_title_2' => $request['header_title_2'],
                    'header_title_3' => $request['header_title_3'],
                    'about_title' => $request['about_title'],
                    'why_choose_us' => $request['why_choose_us'],
                    'why_choose_us_title' => $request['why_choose_us_title'],
                    'testimonial_title' => $request['testimonial_title'],
                    'mobile_app_section_heading' => $request['mobile_app_section_heading'],
                    'mobile_app_section_text' => $request['mobile_app_section_text'],
                    'feature_section_description' => $request['feature_section_description'],
                    'feature_section_title' => $request['feature_section_title'],
                    'footer_article' => $request['footer_article'],

                    'join_us_title' => $request['join_us_title'],
                    'join_us_sub_title' => $request['join_us_sub_title'],
                    'join_us_article' => $request['join_us_article'],
                    'our_platform_title' => $request['our_platform_title'],
                    'our_platform_article' => $request['our_platform_article'],
                    'newsletter_title' => $request['newsletter_title'],
                    'newsletter_article' => $request['newsletter_article'],
                ])
            ]);
            Toastr::success(translate('messages.landing_page_text_updated'));
        } else if ($tab == 'speciality') {
            $data = [];
            $imageName = null;
            $storage = 'public';
            $speciality = BusinessSetting::where('key', 'speciality')->first();
            if ($speciality) {
                $data = json_decode($speciality?->value, true);
                $storage =$data['storage'] ?? 'public';
            }
            if ($request->has('image')) {
                $validator = Validator::make($request->all(), [
                    'image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('image'));
                $storage =Helpers::getDisk();
            }
            array_push($data, [
                'img' => $imageName,
                'title' => $request->speciality_title,
                'storage' => $storage
            ]);

            BusinessSetting::query()->updateOrInsert(['key' => 'speciality'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(translate('messages.landing_page_speciality_updated'));
        } else if ($tab == 'feature') {
            $data = [];
            $imageName = null;
            $storage = 'public';
            $feature = BusinessSetting::where('key', 'feature')->first();
            if ($feature) {
                $data = json_decode($feature?->value, true);
                $storage =$data['storage'] ?? 'public';
            }
            if ($request->has('image')) {
                $validator = Validator::make($request->all(), [
                    'image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('image'));
                $storage =Helpers::getDisk();
            }
            array_push($data, [
                'img' => $imageName,
                'title' => $request->feature_title,
                'feature_description' => $request->feature_description,
                'storage' => $storage
            ]);

            BusinessSetting::query()->updateOrInsert(['key' => 'feature'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(translate('messages.landing_page_feature_updated'));
        }
        else if ($tab == 'testimonial') {
            $data = [];
            $imageName = null;
            $storage ='public';
            $speciality = BusinessSetting::where('key', 'testimonial')->first();
            if ($speciality) {
                $data = json_decode($speciality?->value, true);
                $storage =$data['storage'] ?? 'public';
            }
            if ($request->has('image')) {
                $validator = Validator::make($request->all(), [
                    'image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('image'));
                $storage =Helpers::getDisk();
            }
            array_push($data, [
                'img' => $imageName,
                'name' => $request->reviewer_name,
                'position' => $request->reviewer_designation,
                'detail' => $request->review,
                'storage' => $storage
            ]);

            BusinessSetting::query()->updateOrInsert(['key' => 'testimonial'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(translate('messages.landing_page_testimonial_updated'));
        }
        else if ($tab == 'image') {
            $data = [];
            $images = BusinessSetting::where('key', 'landing_page_images')->first();
            $top_content_image_storage = 'public';
            $about_us_image_storage = 'public';
            $feature_section_image_storage = 'public';
            $mobile_app_section_image_storage = 'public';
            if ($images) {
                $data = json_decode($images?->value, true);
                $top_content_image_storage =$data['top_content_image_storage'] ?? 'public';
                $about_us_image_storage =$data['about_us_image_storage'] ?? 'public';
                $feature_section_image_storage =$data['feature_section_image_storage'] ?? 'public';
                $mobile_app_section_image_storage =$data['mobile_app_section_image_storage'] ?? 'public';
            }
            if ($request->has('top_content_image')) {
                $validator = Validator::make($request->all(), [
                    'top_content_image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('top_content_image'));
                $top_content_image_storage =Helpers::getDisk();
                $data['top_content_image'] = $imageName;
                $data['top_content_image_storage'] = $top_content_image_storage;
            }
            if ($request->has('about_us_image')) {
                $validator = Validator::make($request->all(), [
                    'about_us_image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                 }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('about_us_image'));
                $about_us_image_storage =Helpers::getDisk();
                $data['about_us_image'] = $imageName;
                $data['about_us_image_storage'] = $about_us_image_storage;
            }

            if ($request->has('feature_section_image')) {
                $validator = Validator::make($request->all(), [
                    'feature_section_image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                    }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('feature_section_image'));
                $feature_section_image_storage =Helpers::getDisk();
                $data['feature_section_image'] = $imageName;
                $data['feature_section_image_storage'] = $feature_section_image_storage;
            }
            if ($request->has('mobile_app_section_image')) {
                $validator = Validator::make($request->all(), [
                    'mobile_app_section_image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $imageName = Helpers::upload('landing/image/', 'png', $request->file('mobile_app_section_image'));
                $mobile_app_section_image_storage =Helpers::getDisk();
                $data['mobile_app_section_image'] = $imageName;
                $data['mobile_app_section_image_storage'] = $mobile_app_section_image_storage;
            }
            BusinessSetting::query()->updateOrInsert(['key' => 'landing_page_images'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(translate('messages.landing_page_image_updated'));
        } else if ($tab == 'background-change') {
            BusinessSetting::query()->updateOrInsert(['key' => 'backgroundChange'], [
                'value' => json_encode([
                    'primary_1_hex' => $request['header-bg'],
                    'primary_1_rgb' => Helpers::hex_to_rbg($request['header-bg']),
                    'primary_2_hex' => $request['footer-bg'],
                    'primary_2_rgb' => Helpers::hex_to_rbg($request['footer-bg']),
                ])
            ]);
            Toastr::success(translate('messages.background_updated'));
        } else if ($tab == 'react_header') {
            $data = null;
            $image = BusinessSetting::firstOrNew(['key' => 'react_header_banner']);
            if ($image) {
                $data = $image?->value;
            }
            $image_name =$data ?? \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
            if ($request->has('react_header_banner')) {
                // $image_name = ;
                $validator = Validator::make($request->all(), [
                    'react_header_banner' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $data = Helpers::update( dir: 'react_landing/', old_image:$image_name, format:'png',image: $request->file('react_header_banner')) ?? null;
            }
            $image->value = $data;
            $image->save();
            Toastr::success(translate('Landing page header banner updated'));
        } else if ($tab == 'full-banner') {

            $request->validate([
                'banner_section_img_full' => 'nullable|max:2048',
                'full_banner_section_title' => 'required|max:30',
                'full_banner_section_sub_title' => 'required|max:55',
            ]);

            $data = [];
            $banner_section_full = BusinessSetting::firstOrNew(['key'=>'banner_section_full']);
            $imageName = null;
            $storage = 'public';
            if($banner_section_full){
                $data = json_decode($banner_section_full?->value, true);
                $imageName =$data['banner_section_img_full'] ?? null;
                $storage =$data['storage'] ?? 'public';
            }
            if ($request->has('banner_section_img_full'))   {
                if (empty($imageName)) {
                    $imageName = Helpers::upload( dir:'react_landing/',format: 'png',image: $request->file('banner_section_img_full'));
                    $storage = Helpers::getDisk();
                }  else{
                    $imageName= Helpers::update( dir: 'react_landing/',old_image: $data['banner_section_img_full'],format: 'png', image:$request->file('banner_section_img_full')) ;
                    $storage = Helpers::getDisk();
                }
            }
            $data = [
                'banner_section_img_full' => $imageName,
                'full_banner_section_title' => $request->full_banner_section_title ?? $banner_section_full['full_banner_section_title'] ,
                'full_banner_section_sub_title' => $request->full_banner_section_sub_title ?? $banner_section_full['full_banner_section_sub_title'],
                'storage' => $storage,
            ];
            $banner_section_full->value = json_encode($data);

            $banner_section_full->save();
            Toastr::success(translate('messages.landing_page_banner_section_updated'));
        } else if ($tab == 'discount-banner') {

            $request->validate([
                'img' => 'nullable|max:2048',
                'title' => 'required|max:30',
                'sub_title' => 'required|max:55',
                ]);

            $data = [];
            $discount_banner = BusinessSetting::firstOrNew(['key' => 'discount_banner']);
            $imageName = null;
            if($discount_banner){
                $data = json_decode($discount_banner?->value, true);
                $imageName =$data['img'] ?? null;
            }
            if ($request->has('img'))   {
                if (empty($imageName)) {
                    $imageName = Helpers::upload( dir:'react_landing/', format:'png',image: $request->file('img'));
                    }  else{
                    $imageName= Helpers::update( dir: 'react_landing/', old_image: $data['img'],format: 'png',image: $request->file('img')) ;
                    }
            }
            $data = [
                'img' => $imageName,
                'title' => $request->title ?? $discount_banner['title'] ,
                'sub_title' => $request->sub_title ?? $discount_banner['sub_title'],
            ];
            $discount_banner->value = json_encode($data);

            $discount_banner->save();
            Toastr::success(translate('messages.landing_page_discount_banner_section_updated'));
        } else if ($tab == 'banner-section-half') {

            $request->validate([
                'image' => 'nullable|max:2048',
                'title' => 'nullable|max:20',
                'sub_title' => 'nullable|max:30',
            ]);
            $data = [];
            $imageName = null;
            $storage = 'public';
            $banner_section_half = BusinessSetting::firstOrNew(['key'=>'banner_section_half']);
            if ($banner_section_half) {
                $data = json_decode($banner_section_half?->value, true);
                $storage =$data['storage'] ?? 'public';
            }

            if ($request->has('image')) {
                $imageName=Helpers::upload( dir:'react_landing/',format:'png', image:$request->file('image')) ;
            }
            array_push($data, [
                'img' => $imageName,
                'title' => $request->title ?? null,
                'sub_title' => $request->sub_title ?? null,
                'storage' => $storage
            ]);

            $banner_section_half->value = json_encode($data);

            $banner_section_half->save();
            Toastr::success(translate('messages.landing_page_banner_section_updated'));
        }
        else if ($tab == 'app_section_image') {
            $data = [];
            $app_section_image_storage ='public';
            $app_section_image_2_storage ='public';
            $images = BusinessSetting::firstOrNew(['key' => 'app_section_image']);
            if ($images) {
                $data = json_decode($images?->value, true);
                $app_section_image_storage =$data['app_section_image_storage'] ?? 'public';
                $app_section_image_2_storage =$data['app_section_image_2_storage'] ?? 'public';
            }
            if ($request->has('app_section_image')) {
                $validator = Validator::make($request->all(), [
                    'app_section_image' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }

                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $imageName = Helpers::update( dir: 'react_landing/', old_image:$imageName, format:'png', image:$request->file('app_section_image'));
                $app_section_image_storage = Helpers::getDisk();
                $data['app_section_image'] = $imageName;
                $data['app_section_image_storage'] = $app_section_image_storage;
            }
            if ($request->has('app_section_image_2')) {
                $validator = Validator::make($request->all(), [
                    'app_section_image_2' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                 }
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $imageName = Helpers::update( dir: 'react_landing/',  old_image:$imageName, format:'png',image: $request->file('app_section_image_2'));
                $app_section_image_2_storage = Helpers::getDisk();
                $data['app_section_image_2'] = $imageName;
                $data['app_section_image_2_storage'] = $app_section_image_2_storage;
            }

            $images->value = json_encode($data);

            $images->save();
            Toastr::success(translate('messages.App section image updated'));
        }

        else if ($tab == 'footer_logo') {
            $data = null;
            $image = BusinessSetting::firstOrNew(['key' => 'footer_logo']);
            if ($image) {
                $data = $image?->value;
            }
            $image_name =$data ?? \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
            if ($request->has('footer_logo')) {
                $validator = Validator::make($request->all(), [
                    'footer_logo' => 'required|max:2048',
                ]);
                if ($validator->fails()) {
                Toastr::error( translate('Image size must be within 2mb'));
                return back();
                }
                $data = Helpers::update( dir: 'react_landing/', old_image: $image_name, format:'png', image:$request->file('footer_logo')) ?? null;
            }
            $image->value = json_encode($data);

            $image->save();
            Toastr::success(translate('Footer logo updated'));
        } 
        return back();
    }

    public function delete_landing_page_settings($tab, $key)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }
        $item = BusinessSetting::where('key', $tab)->first();
        $data = $item ? json_decode($item?->value, true) : null;
        if ($data && array_key_exists($key, $data)) {
            if($tab == 'react_feature' && isset($data[$key]['img'])){
                Helpers::check_and_delete('react_landing/feature/' , $data[$key]['img']);
            }
            if ( $tab != 'react_feature' && isset($data[$key]['img']) && file_exists(public_path('assets/landing/image') . $data[$key]['img'])) {
                unlink(public_path('assets/landing/image') . $data[$key]['img']);
            }

            array_splice($data, $key, 1);

            $item->value = json_encode($data);
            $item->save();
            Toastr::success(translate('messages.' . $tab) . ' ' . translate('messages.deleted'));
            return back();
        }
        Toastr::error(translate('messages.not_found'));
        return back();

    }

    private function update_data($request, $key_data){
        $data = DataSetting::firstOrNew(
            ['key' =>  $key_data,
            'type' =>  'admin_landing_page'],
        );

        $data->value = $request->{$key_data}[array_search('default', $request->lang)];
        $data->save();
        $default_lang = str_replace('_', '-', app()->getLocale());
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->{$key_data}[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type' => 'App\Models\DataSetting',
                            'translationable_id' => $data->id,
                            'locale' => $key,
                            'key' => $key_data
                        ],
                        ['value' => $data->value]
                    );
                }
            } else {
                if ($request->{$key_data}[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type' => 'App\Models\DataSetting',
                            'translationable_id' => $data->id,
                            'locale' => $key,
                            'key' => $key_data
                        ],
                        ['value' => $request->{$key_data}[$index]]
                    );
                }
            }
        }

        return true;
    }


    private function policy_status_update($key_data , $status){
        $data = DataSetting::firstOrNew(
            ['key' =>  $key_data,
            'type' =>  'admin_landing_page'],
        );
        $data->value = $status;
        $data->save();

        return true;
    }


    public function terms_and_conditions()
    {
        $terms_and_conditions =DataSetting::withoutGlobalScope('translate')->where('type', 'admin_landing_page')->where('key', 'terms_and_conditions')->first();
        return view('admin-views.business-settings.terms-and-conditions', compact('terms_and_conditions'));
    }

    public function terms_and_conditions_update(Request $request)
    {
        $this->update_data($request , 'terms_and_conditions');
        Toastr::success(translate('messages.terms_and_condition_updated'));
        return back();
    }

    public function privacy_policy()
    {
        $privacy_policy =DataSetting::withoutGlobalScope('translate')->where('type', 'admin_landing_page')->where('key', 'privacy_policy')->first();
        return view('admin-views.business-settings.privacy-policy', compact('privacy_policy'));
    }

    public function privacy_policy_update(Request $request)
    {
        $this->update_data($request , 'privacy_policy');
        Toastr::success(translate('messages.privacy_policy_updated'));
        return back();
    }

    public function about_us()
    {
        $about_us =DataSetting::withoutGlobalScope('translate')->where('type', 'admin_landing_page')->where('key', 'about_us')->first();
        return view('admin-views.business-settings.about-us', compact('about_us'));
    }

    public function about_us_update(Request $request)
    {
        $this->update_data($request , 'about_us');
        Toastr::success(translate('messages.about_us_updated'));
        return back();
    }

    public function config_setup()
    {
        return view('admin-views.business-settings.config');
    }

    public function config_update(Request $request)
    {
        BusinessSetting::query()->updateOrInsert(['key' => 'map_api_key'], [
            'value' => $request['map_api_key']
        ]);

        BusinessSetting::query()->updateOrInsert(['key' => 'map_api_key_server'], [
            'value' => $request['map_api_key_server']
        ]);

        Toastr::success(translate('messages.config_data_updated'));
        return back();
    }

    public function toggle_settings($key, $value)
    {
        BusinessSetting::query()->updateOrInsert(['key' => $key], [
            'value' => $value
        ]);

        Toastr::success(translate('messages.app_settings_updated'));
        return back();
    }

    //recaptcha
    public function recaptcha_index(Request $request)
    {
        return view('admin-views.business-settings.recaptcha-index');
    }

    public function recaptcha_update(Request $request)
    {
        BusinessSetting::query()->updateOrInsert(['key' => 'recaptcha'], [
            'key' => 'recaptcha',
            'value' => json_encode([
                'status' => $request['status'],
                'site_key' => $request['site_key'],
                'secret_key' => $request['secret_key']
            ]),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        Toastr::success(translate('messages.updated_successfully'));
        return back();
    }

    public function send_mail(Request $request)
    {
        $response_flag = 0;
        $message = 'success';
        try {

            Mail::to($request->email)->send(new \App\Mail\TestEmailSender());
            $response_flag = 1;
        } catch (\Exception $exception) {
            info([$exception->getFile(),$exception->getLine(),$exception->getMessage()]);
            $response_flag = 2;
            $message = $exception->getMessage();
        }
        return response()->json(['success' => $response_flag , 'message' => $message]);
    }

    public function site_direction(Request $request){
        if (env('APP_MODE') == 'demo') {
            session()->put('site_direction', ($request->status == 1?'ltr':'rtl'));
            return response()->json();
        }
        if($request->status == 1){
            BusinessSetting::query()->updateOrInsert(['key' => 'site_direction'], [
                'value' => 'ltr'
            ]);
        } else
        {
            BusinessSetting::query()->updateOrInsert(['key' => 'site_direction'], [
                'value' => 'rtl'
            ]);
        }
        return ;
    }

    public function email_index(Request $request,$type,$tab)
    {
        $template = $request->query('template',null);
        if ($tab == 'forgot-password') {
            return view('admin-views.business-settings.email-format-setting.'.$type.'-email-formats.forgot-pass-format',compact('template'));
        }
    }

    public function update_email_index(Request $request,$type,$tab)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }
        if($tab == 'forget-password'){
            $email_type = 'forget_password';
            $template = EmailTemplate::where('type',$type)->where('email_type', 'forget_password')->first();
        }
        if ($template == null) {
            $template = new EmailTemplate();
        }

        $template->title = $request->title[array_search('default', $request->lang)];
        $template->body = $request->body[array_search('default', $request->lang)];
        $template->body_2 = $request?->body_2 ? $request->body_2[array_search('default', $request->lang)] : null;
        $template->button_name = $request->button_name?$request->button_name[array_search('default', $request->lang)]:'';
        $template->footer_text = $request->footer_text[array_search('default', $request->lang)];
        $template->copyright_text = $request->copyright_text[array_search('default', $request->lang)];
        $template->background_image = $request->has('background_image') ? Helpers::update('email_template/', $template->background_image, 'png', $request->file('background_image')) : $template->background_image;
        $template->image = $request->has('image') ? Helpers::update('email_template/', $template->image, 'png', $request->file('image')) : $template->image;
        $template->logo = $request->has('logo') ? Helpers::update('email_template/', $template->logo, 'png', $request->file('logo')) : $template->logo;
        $template->icon = $request->has('icon') ? Helpers::update('email_template/', $template->icon, 'png', $request->file('icon')) : $template->icon;
        $template->email_type = $email_type;
        $template->type = $type;
        $template->button_url = $request->button_url??'';
        $template->email_template = $request->email_template;
        $template->privacy = $request->privacy?'1':0;
        $template->contact = $request->contact?'1':0;
        $template->facebook = $request->facebook?'1':0;
        $template->instagram = $request->instagram?'1':0;
        $template->twitter = $request->twitter?'1':0;
        $template->linkedin = $request->linkedin?'1':0;
        $template->pinterest = $request->pinterest?'1':0;
        $template->save();
        $default_lang = str_replace('_', '-', app()->getLocale());
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->title[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'title'
                        ],
                        ['value'                 => $template->title]
                    );
                }
            } else {

                if ($request->title[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'title'
                        ],
                        ['value'                 => $request->title[$index]]
                    );
                }
            }
            if ($default_lang == $key && !($request->body[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'body'
                        ],
                        ['value'                 => $template->body]
                    );
                }
            } else {

                if ($request->body[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'body'
                        ],
                        ['value'                 => $request->body[$index]]
                    );
                }
            }

            if ($request?->body_2 && $default_lang == $key && !($request->body_2[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'body_2'
                        ],
                        ['value'                 => $template->body_2]
                    );
                }
            } else {

                if ($request?->body_2 && $request->body_2[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'body_2'
                        ],
                        ['value'                 => $request->body_2[$index]]
                    );
                }
            }
            if ($default_lang == $key && !($request->button_name && $request->button_name[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'button_name'
                        ],
                        ['value'                 => $template->button_name]
                    );
                }
            } else {

                if ($request->button_name && $request->button_name[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'button_name'
                        ],
                        ['value'                 => $request->button_name[$index]]
                    );
                }
            }
            if ($default_lang == $key && !($request->footer_text[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'footer_text'
                        ],
                        ['value'                 => $template->footer_text]
                    );
                }
            } else {

                if ($request->footer_text[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'footer_text'
                        ],
                        ['value'                 => $request->footer_text[$index]]
                    );
                }
            }
            if ($default_lang == $key && !($request->copyright_text[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'copyright_text'
                        ],
                        ['value'                 => $template->copyright_text]
                    );
                }
            } else {

                if ($request->copyright_text[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\EmailTemplate',
                            'translationable_id'    => $template->id,
                            'locale'                => $key,
                            'key'                   => 'copyright_text'
                        ],
                        ['value'                 => $request->copyright_text[$index]]
                    );
                }
            }
        }

        Toastr::success(translate('messages.template_added_successfully'));
        return back();
    }

    public function update_email_status(Request $request,$type,$tab,$status)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }

        if ($tab == 'forgot-password') {
            BusinessSetting::query()->updateOrInsert(['key' => 'forget_password_mail_status_'.$type], [
                'value' => $status
            ]);
        }
        Toastr::success(translate('messages.email_status_updated'));
        return back();

    }

    public function login_url_page(){
        $data=array_column(DataSetting::whereIn('key',['restaurant_employee_login_url','restaurant_login_url','admin_employee_login_url','admin_login_url'
                ])->get(['key','value'])->toArray(), 'value', 'key');

        return view('admin-views.login-setup.login_setup',compact('data'));
    }

    public function login_url_page_update(Request $request){

        $request->validate([
            'type' => 'required',
            'admin_login_url' => 'nullable|regex:/^[a-zA-Z0-9\-\_]+$/u|unique:data_settings,value',
            'admin_employee_login_url' => 'nullable|regex:/^[a-zA-Z0-9\-\_]+$/u|unique:data_settings,value',
        ]);

        if($request->type == 'admin') {
            DataSetting::query()->updateOrInsert(['key' => 'admin_login_url','type' => 'login_admin'], [
                'value' => $request->admin_login_url
            ]);
        }
        elseif($request->type == 'admin_employee') {
            DataSetting::query()->updateOrInsert(['key' => 'admin_employee_login_url','type' => 'login_admin_employee'], [
                'value' => $request->admin_employee_login_url
            ]);
        }
        Toastr::success(translate('messages.update_successfull'));
        return back();
    }


    public function remove_image(Request $request){

        $request->validate([
            'model_name' => 'required',
            'id' => 'required',
            'image_path' => 'required',
            'field_name' => 'required',
        ]);
    try {

        $model_name = $request->model_name;
        $model = app("\\App\\Models\\{$model_name}");
        $data=  $model->where('id', $request->id)->first();

        $data_value = $data?->{$request->field_name};
        if (!$data_value){
            $data_value = json_decode($data?->value, true);
        }

                if($request?->json == 1){
                    Helpers::check_and_delete($request->image_path.'/' , $data_value[$request->field_name]);
                    $data_value[$request->field_name] = null;
                    $data->value = json_encode($data_value);
                }
                else{
                    Helpers::check_and_delete($request->image_path.'/' , $data_value);
                    $data->{$request->field_name} = null;
                }

        $data?->save();

    } catch (\Throwable $th) {
        Toastr::error($th->getMessage(). 'Line....'.$th->getLine());
        return back();
    }
        Toastr::success(translate('messages.Image_removed_successfully'));
        return back();
    }

    public function landing_page_settings_update(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'landing_integration_via' => 'required',
            'redirect_url' => 'required_if:landing_integration_via,url',
            'file_upload' => 'mimes:zip'
        ]);

        if(!File::exists('resources/views/layouts/landing/custom/index.blade.php') && ($request->landing_integration_via == 'file_upload') && (!$request->file('file_upload'))){
            $validator->getMessageBag()->add('file_upload', translate('messages.zip_file_is_required'));
        }

        if ($validator->errors()->count() > 0) {
            $error = Helpers::error_processor($validator);
            return response()->json(['status' => 'error', 'message' => $error[0]['message']]);
        }

        DB::table('business_settings')->updateOrInsert(['key' => 'landing_integration_type'], [
            'value' => $request['landing_integration_via']
        ]);
        $status = 'success';
        $message = translate('updated_successfully!');

        if($request->landing_integration_via == 'file_upload'){

            $file = $request->file('file_upload');
            if($file){

                $filename = $file->getClientOriginalName();
                $tempPath = $file->storeAs('temp', $filename);
                $zip = new \ZipArchive();
                if ($zip->open(storage_path('app/' . $tempPath)) === TRUE) {
                    // Extract the contents to a directory
                    $extractPath = base_path('resources/views/layouts/landing/custom');
                    $zip->extractTo($extractPath);
                    $zip->close();
                    if(File::exists($extractPath.'/index.blade.php')){
                        Toastr::success(translate('file_upload_successfully!'));
                        $status = 'success';
                        $message = translate('file_upload_successfully!');
                    }else{
                        File::deleteDirectory($extractPath);
                        $status = 'error';
                        $message = translate('invalid_file!');
                    }
                }else{
                    $status = 'error';
                    $message = translate('file_upload_fail!');
                }

                Storage::delete($tempPath);
            }
        }

        if($request->landing_integration_via == 'url'){
            DB::table('business_settings')->updateOrInsert(['key' => 'landing_page_custom_url'], [
                'value' => $request['redirect_url']
            ]);

            $status = 'success';
            $message = translate('url_saved_successfully!');
        }

        return response()->json([
            'status' => $status,
            'message'=> $message
        ]);
    }

    public function delete_custom_landing_page()
    {
        $filePath = 'resources/views/layouts/landing/custom/index.blade.php';

        if (File::exists($filePath)) {
            File::delete($filePath);
            Toastr::success(translate('messages.File_deleted_successfully'));
            return back();
        } else {
            Toastr::error(translate('messages.File_not_found'));
            return back();
        }
    }

    public function notification_setup(Request $request){
        if(NotificationSetting::count() == 0 ){
            Helpers::notificationDataSetup();
        }
        $data= NotificationSetting::
            when( $request?->type == null ||  $request?->type == 'admin'  , function($query){
            $query->where('type','admin');
        })->get();

        $business_name= BusinessSetting::where('key','business_name')->first()?->value;
        return view('admin-views.business-settings.notification_setup',compact('business_name' ,'data'));
    }

    public function notification_status_change($key,$user_type, $type){
        $data= NotificationSetting::where('type',$user_type)->where('key',$key)->first();
        if(!$data){
            Toastr::error(translate('messages.Notification_settings_not_found'));
            return back();
        }
        if($type == 'Mail' ) {
            $data->mail_status =  $data->mail_status == 'active' ? 'inactive' : 'active';
        }
        elseif($type == 'SMS' ) {
            $data->sms_status =  $data->sms_status == 'active' ? 'inactive' : 'active';
        }
        $data?->save();
        Toastr::success(translate('messages.Notification_settings_updated'));
        return back();
    }


}
