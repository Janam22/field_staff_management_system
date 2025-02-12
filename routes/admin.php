<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\CashBackController;


Route::group(['namespace' => 'Admin', 'as' => 'admin.'], function () {

    Route::group(['middleware' => ['admin']], function () {
        Route::get('lang/{locale}', 'LanguageController@lang')->name('lang');
        Route::get('settings', 'SystemController@settings')->name('settings');
        Route::get('system-currency', 'SystemController@system_currency')->name('system_currency');
        Route::post('settings', 'SystemController@settings_update');
        Route::post('settings-password', 'SystemController@settings_password_update')->name('settings-password');
        Route::get('/get-service-data', 'SystemController@service_data')->name('get-service-data');
        Route::post('/update-fcm-toke', 'SystemController@update_fcm_token')->name('update-fcm');

        //dashboard
        Route::get('/', 'DashboardController@dashboard')->name('dashboard');
        Route::get('landing-page', 'SystemController@landing_page')->name('landing-page');

        Route::post('maintenance-mode', 'SystemController@maintenance_mode')->name('maintenance-mode');

        Route::group(['prefix' => 'dashboard-stats', 'as' => 'dashboard-stats.'], function () {
            Route::post('order', 'DashboardController@order')->name('order');
            Route::post('zone', 'DashboardController@zone')->name('zone');
            Route::post('user-overview', 'DashboardController@user_overview')->name('user-overview');
            Route::post('business-overview', 'DashboardController@business_overview')->name('business-overview');
        });

        Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
            Route::get('create', 'CustomRoleController@create')->name('create');
            Route::post('create', 'CustomRoleController@store');
            Route::get('edit/{id}', 'CustomRoleController@edit')->name('edit');
            Route::post('update/{id}', 'CustomRoleController@update')->name('update');
            Route::delete('delete/{id}', 'CustomRoleController@distroy')->name('delete');
            Route::post('search', 'CustomRoleController@search')->name('search');
            Route::get('export-employee-role', 'CustomRoleController@employee_role_export')->name('export-employee-role');
        });

        Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
            Route::get('add-new', 'EmployeeController@add_new')->name('add-new');
            Route::post('add-new', 'EmployeeController@store');
            Route::get('list', 'EmployeeController@list')->name('list');
            Route::get('update/{id}', 'EmployeeController@edit')->name('edit');
            Route::post('update/{id}', 'EmployeeController@update')->name('update');
            Route::delete('delete/{id}', 'EmployeeController@distroy')->name('delete');
            Route::get('export-employee', 'EmployeeController@employee_list_export')->name('export-employee');
        });

        Route::group(['prefix' => 'banner', 'as' => 'banner.', 'middleware' => ['module:banner']], function () {
            Route::get('add-new', 'BannerController@index')->name('add-new');
            Route::post('store', 'BannerController@store')->name('store');
            Route::get('edit/{banner}', 'BannerController@edit')->name('edit');
            Route::post('update/{banner}', 'BannerController@update')->name('update');
            Route::get('status/{id}/{status}', 'BannerController@status')->name('status');
            Route::delete('delete/{banner}', 'BannerController@delete')->name('delete');
            Route::post('search', 'BannerController@search')->name('search');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.', 'middleware' => ['module:settings', 'actch']], function () {
            Route::post('update-landing-setup', 'BusinessSettingsController@landing_page_settings_update')->name('business-setup.update-landing-setup');
            Route::delete('delete-custom-landing-page', 'BusinessSettingsController@delete_custom_landing_page')->name('business-setup.delete-custom-landing-page');

            Route::get('business-setup/{tab?}', 'BusinessSettingsController@business_index')->name('business-setup');
            Route::post('update-dm', 'BusinessSettingsController@update_dm')->name('update-dm');
            Route::post('update-order', 'BusinessSettingsController@update_order')->name('update-order');
            Route::post('update-priority', 'BusinessSettingsController@update_priority')->name('update-priority');
            Route::get('config-setup', 'BusinessSettingsController@config_setup')->name('config-setup');
            Route::post('config-update', 'BusinessSettingsController@config_update')->name('config-update');
            Route::post('update-setup', 'BusinessSettingsController@business_setup')->name('update-setup');
            Route::get('theme-settings', 'BusinessSettingsController@theme_settings')->name('theme-settings');
            Route::POST('theme-settings-update', 'BusinessSettingsController@update_theme_settings')->name('theme-settings-update');
            Route::get('app-settings', 'BusinessSettingsController@app_settings')->name('app-settings');
            Route::POST('app-settings', 'BusinessSettingsController@update_app_settings')->name('app-settings');
            Route::get('notification-setup', 'BusinessSettingsController@notification_setup')->name('notification_setup');
            Route::get('notification-status-change/{key}/{user_type}/{type}', 'BusinessSettingsController@notification_status_change')->name('notification_status_change');

            Route::get('toggle-settings/{key}/{value}', 'BusinessSettingsController@toggle_settings')->name('toggle-settings');

            Route::get('mail-config', 'BusinessSettingsController@mail_index')->name('mail-config');
            Route::post('mail-config', 'BusinessSettingsController@mail_config');
            Route::post('mail-config-status', 'BusinessSettingsController@mail_config_status')->name('mail-config-status');
            Route::get('send-mail', 'BusinessSettingsController@send_mail')->name('mail.send');

            Route::get('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions')->name('terms-and-conditions');
            Route::post('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions_update');

            Route::get('pages/privacy-policy', 'BusinessSettingsController@privacy_policy')->name('privacy-policy');
            Route::post('pages/privacy-policy', 'BusinessSettingsController@privacy_policy_update');

            Route::get('pages/cancellation-policy', 'BusinessSettingsController@cancellation_policy')->name('cancellation-policy');
            Route::post('pages/cancellation-policy', 'BusinessSettingsController@cancellation_policy_update');
            Route::get('pages/cancellation-policy/{status}', 'BusinessSettingsController@cancellation_policy_status')->name('cancellation-policy-status');

            Route::get('pages/about-us', 'BusinessSettingsController@about_us')->name('about-us');
            Route::post('pages/about-us', 'BusinessSettingsController@about_us_update');

            //recaptcha
            Route::get('recaptcha', 'BusinessSettingsController@recaptcha_index')->name('recaptcha_index');
            Route::post('recaptcha-update', 'BusinessSettingsController@recaptcha_update')->name('recaptcha_update');
            
            Route::get('social-media/fetch', 'SocialMediaController@fetch')->name('social-media.fetch');
            Route::get('social-media/status-update', 'SocialMediaController@social_media_status_update')->name('social-media.status-update');
            Route::resource('social-media', 'SocialMediaController');
            //file_system
            Route::get('storage-connection', 'BusinessSettingsController@storage_connection_index')->name('storage_connection_index');
            Route::post('storage-connection-update/{name}', 'BusinessSettingsController@storage_connection_update')->name('storage_connection_update');

            //db clean
            Route::get('db-index', 'DatabaseSettingController@db_index')->name('db-index');
            Route::post('db-clean', 'DatabaseSettingController@clean_db')->name('clean-db');

            Route::get('site_direction', 'BusinessSettingsController@site_direction')->name('site_direction');

            Route::get('email-setup/{type}/{tab?}', 'BusinessSettingsController@email_index')->name('email-setup');
            Route::POST('email-setup/{type}/{tab?}', 'BusinessSettingsController@update_email_index')->name('email-setup');
            Route::get('email-status/{type}/{tab}/{status}', 'BusinessSettingsController@update_email_status')->name('email-status');
        });

        Route::group(['prefix' => 'customer', 'as' => 'customer.', 'middleware' => ['module:customerList']], function () {
            Route::get('subscribed', 'CustomerController@subscribedCustomers')->name('subscribed');
            Route::get('subscriber-export', 'CustomerController@subscribed_customer_export')->name('subscriber-export');
        });

        Route::group(['prefix' => 'contact', 'as' => 'contact.','middleware'=>['module:contact_message']], function () {
            Route::get('list', 'ContactMessages@list')->name('list');
            Route::delete('delete', 'ContactMessages@destroy')->name('delete');
            Route::get('view/{id}', 'ContactMessages@view')->name('view');
            Route::post('update/{id}', 'ContactMessages@update')->name('update');
            Route::post('send-mail/{id}', 'ContactMessages@send_mail')->name('send-mail');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'language.','middleware' => ['module:settings']], function () {
            Route::get('language', 'LanguageController@index')->name('index');
            Route::post('language/add-new', 'LanguageController@store')->name('add-new');
            Route::get('language/update-status', 'LanguageController@update_status')->name('update-status');
            Route::get('language/update-default-status', 'LanguageController@update_default_status')->name('update-default-status');
            Route::post('language/update', 'LanguageController@update')->name('update');
            Route::get('language/translate/{lang}', 'LanguageController@translate')->name('translate');
            Route::post('language/translate-submit/{lang}', 'LanguageController@translate_submit')->name('translate-submit');
            Route::post('language/remove-key/{lang}', 'LanguageController@translate_key_remove')->name('remove-key');
            Route::get('language/delete/{lang}', 'LanguageController@delete')->name('delete');
            Route::any('language/auto-translate/{lang}', 'LanguageController@auto_translate')->name('auto-translate');
            Route::get('language/auto-translate-all/{lang}', 'LanguageController@auto_translate_all')->name('auto_translate_all');
        });

        Route::group(['prefix' => 'login-url', 'as' => 'login_url.', 'middleware' => ['module:settings']], function () {
            Route::get('login-page-setup', 'BusinessSettingsController@login_url_page')->name('login_url_page');
            Route::post('login-page-setup/update', 'BusinessSettingsController@login_url_page_update')->name('login_url_page_update');
        });

        Route::post('remove_image', 'BusinessSettingsController@remove_image')->name('remove_image');

    });
});

