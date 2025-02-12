<!DOCTYPE html>

<?php
    if(session()->get('landing_site_direction') ){
        $site_direction = session()->get('landing_site_direction');
    } else{
        $site_direction = session()->get('site_direction');
    }
    $country=\App\Models\BusinessSetting::where('key','country')->first();
    $countryCode= strtolower($country?$country->value:'auto');
?>
@php( $direction= ( $site_direction === 'rtl') ? "true" : "false")

<html dir="{{ $site_direction }}" lang="{{ str_replace('_', '-', app()->getLocale()) }}" >

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>BhojMandu: Online Food Delivery and Night Service in Kathmandu</title>
  <meta name="description" content="BhojMandu: Your Premier Choice for Online Food Delivery in Kathmandu, Birgunj. Experience the Best Night Service in Nepal with Swift and Convenient Orders. Diverse Restaurant Options for Day and Late-Night Cravings. Elevate Your Dining Experience at BhojMandu, Where Quality Meets Convenience.">
  <meta name="keywords" content="night food delivery, cake delivery, liquor delivery, online grocery, Kathmandu food delivery, Birgunj online delivery, BhojMandu, BhojMandu delivery, BhojMandu online, hygienic food delivery, quality food delivery, fresh food delivery, convenient food delivery, easy online ordering, quick delivery service, diverse food options, cake variety, liquor selection,Food delivery app in Kathmandu,Food delivery apps in Kathmandu,Best food delivery app in Kathmandu,late night food delivery in nepal,online liquors delivery in kathmandu,beer delivery in night kathmandu,fast food delivery app in kathmandu nepal,food app in hetauda, night food delivery in kathmandu, mid night cake delivery app, mid night food delivery app in kathmandu, online food delivery in nepal, pizza delivery in birgunj, online food delivery in birgunj, best food delivery app nepal,fast online food delivery nepal, food delivery hetauda, food delivery service, BhojMandu is the Best Online Cake Shop to Order Cakes Online in Kathmandu, Home delivery of Cake, Mini Cake, Cupcake in Nepal food delivery in Kathmandu, food delivery service in Kathmandu, food delivery service in Pokhara, food delivery service Kathmmandu, food delivery service in Nepal, order food online, food ordering app, on-demand food delivery, online food order, restaurant food delivery Kathmandu, restaurant delivrey Pokhara, food delivery, restaurant food delivery Kathmandu Nepal, home delivery Kathmandu, home delivery Pokhara, pizza delivery Kathmandu Nepal, online food delivery nepal, best food delivery app, online delivery food in nepal, bhojmandu birgunj, biryani delivery in birgunj, online night food delivvery, best food delivery in birgunj and hetaudafood delivery in hetauda, cake delivery in kathmandu,cake delivery in birgunj,online cake delivery in birgunj,online food delivery app in hetauda,midnight food delivery,night delivery in kathmandu,food delivery night service,bhojmandu night delivery,online food delivery app, online food delivery in pokhara,Online food delivery in Bhaktapur,Online delivery in Pokhara,Pizza home delivery in Pokhara,food delivery in kalaiya,birgunj online food delivery app,online food delivery in birgunj,best online food delivery in birgunj,cakes delivery in birgunj and kalaiya,pizza delivery in birgunj and kalaiya Best pizza in Pokhara,Online cake delivery in Pokhara, Food delivery app in Nepal,Online food delivery in Kathmandu during lockdown,online food delivery in kathmandu in lockdown,online food delivery in lalitpur, food delivery service, food delivery in Kathmandu, online food delivery in Nepal, food delivery service in Kathmandu, food delivery service in Lalitpur, food delivery service Kathmmandu, food delivery service in Nepal, order food online, food ordering app, on-demand food delivery, online food order, restaurant food delivery Kathmandu, restaurant delivrey Pokhara, food delivery, restaurant food delivery Kathmandu Nepal, home delivery Kathmandu, BhojMandu online food delivery, pizza delivery in kathmandu, home delivery kathmandu, pizza delivery Kathmandu Nepal" />
  <meta property="og:title" content="BhojMandu: Online Food Delivery and Night Service in Kathmandu" />
  <meta property="og:url" content="https://bhojmandu.com" />
  <meta property="og:type" content="BhojMandu: Online Food Delivery in Kathmandu, Birgunj | Best Night Service in Nepal" />
  <meta property="og:description" content="BhojMandu: Your Premier Choice for Online Food Delivery in Kathmandu, Birgunj. Experience the Best Night Service in Nepal with Swift and Convenient Orders. Diverse Restaurant Options for Day and Late-Night Cravings. Elevate Your Dining Experience at BhojMandu, Where Quality Meets Convenience.">
  <meta property="og:image" content="https://bhojmandu.com/seo_np.png">
  <meta property="og:site_name" content="BhojMandu: Online Food Delivery and Night Service in Kathmandu" />
  <meta name="google-site-verification" content="XwrVVOkDete6NZirN0OUDfem4SLBT8bZZKT1zFW1U9c"/>

  <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-92J84SH8ED"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-92J84SH8ED');
</script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-11145962269">
</script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-11145962269');
</script>

<script type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "koebt4o4y4");
</script>

<!-- Facebook Pixel Code -->
  <script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '132960358767308');
    fbq('track', 'PageView');
    </script>


    <link rel="stylesheet" href="{{dynamicAsset('public/assets/admin')}}/vendor/icon-set/style.css">

    <link rel="stylesheet" href="{{dynamicAsset('/public/assets/landing/assets_new/css/bootstrap.min.css')}}" />
    <link rel="stylesheet" href="{{dynamicAsset('/public/assets/landing/assets_new/css/animate.css')}}" />
    <link rel="stylesheet" href="{{dynamicAsset('/public/assets/landing/assets_new/css/all.min.css')}}" />
    <link rel="stylesheet" href="{{dynamicAsset('/public/assets/landing/assets_new/css/owl.min.css')}}" />
    <link rel="stylesheet" href="{{dynamicAsset('/public/assets/landing/assets_new/css/main.css')}}" />
    <link rel="stylesheet" href="{{ dynamicAsset('public/assets/admin/css/toastr.css') }}">
    <link rel="stylesheet" href="{{ dynamicAsset('public/assets/admin/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{dynamicAsset('public/assets/admin/intltelinput/css/intlTelInput.css')}}">
    @php($icon = \App\CentralLogics\Helpers::get_settings('icon'))
    <link rel="shortcut icon" type="image/x-icon" href="{{ dynamicStorage('storage/app/public/business/'. $icon ?? '') }}">


    @php($landing_page_links = \App\Models\BusinessSetting::where(['key' => 'landing_page_links'])->first())
    @php($landing_page_links = isset($landing_page_links->value) ? json_decode($landing_page_links->value, true) : null)
    @php($backgroundChange = \App\Models\BusinessSetting::where(['key' => 'backgroundChange'])->first())
    @php($backgroundChange = isset($backgroundChange) && \App\Models\BusinessSetting::where(['key' => 'backgroundChange'])->first()->value ? json_decode(\App\Models\BusinessSetting::where(['key' => 'backgroundChange'])->first()->value,true):'')
    @if (isset($backgroundChange['primary_1_hex']) && isset($backgroundChange['primary_2_hex']))
        <style>
            :root {
                --base-1: <?php echo $backgroundChange['primary_1_hex']; ?>;
                --base-rgb: <?php echo $backgroundChange['primary_1_rgb']; ?>;
                --base-2: <?php echo $backgroundChange['primary_2_hex']; ?>;
                --base-rgb-2:<?php echo $backgroundChange['primary_2_rgb']; ?>;
                --base-1-rgb: <?php echo $backgroundChange['primary_2_rgb']; ?>;
                --base-15-rgb: <?php echo $backgroundChange['primary_2_rgb']; ?>;
            }
        </style>
    @endif
    @stack('css_or_js')
</head>

<body>
        <!-- ==== Preloader ==== -->
        <div id="landing-loader"></div>
        <!-- ==== Preloader ==== -->

    @yield('content')


        <!-- ======= Footer Section ======= -->
        <?php
            $datas =  \App\Models\DataSetting::with('translations')->where('type','admin_landing_page')->whereIn('key', ['news_letter_title','news_letter_sub_title','footer_data','shipping_policy_status','refund_policy_status','cancellation_policy_status'])->get();
                    $data = [];
                    foreach ($datas as $key => $value) {
                        if(count($value->translations)>0){
                            $cred = [
                                $value->key => $value->translations[0]['value'],
                            ];
                            array_push($data,$cred);
                        }else{
                            $cred = [
                                $value->key => $value->value,
                            ];
                            array_push($data,$cred);
                        }
                    }
                    $landing_data = [];
                    foreach($data as $single_data){
                        foreach($single_data as $key=>$single_value){
                            $landing_data[$key] = $single_value;
                        }
                    }
        ?>


        <script src="{{dynamicAsset('/public/assets/landing/assets_new/js/jquery-3.6.0.min.js')}}"></script>
        <script src="{{dynamicAsset('/public/assets/landing/assets_new/js/bootstrap.min.js')}}"></script>
        <script src="{{dynamicAsset('/public/assets/landing/assets_new/js/viewport.jquery.js')}}"></script>
        <script src="{{dynamicAsset('/public/assets/landing/assets_new/js/wow.min.js')}}"></script>
        <script src="{{dynamicAsset('/public/assets/landing/assets_new/js/owl.min.js')}}"></script>
        <script src="{{dynamicAsset('/public/assets/landing/assets_new/js/main.js')}}"></script>
        <script src="{{ dynamicAsset('/public/assets/admin/js/toastr.js') }}"></script>
        <script src="{{ dynamicAsset('/public/assets/admin/js/select2.min.js') }}"></script>
        <script src="{{dynamicAsset('public/assets/admin/intltelinput/js/intlTelInput.min.js')}}"></script>
        {!! Toastr::message() !!}
        @if ($errors->any())
        <script>
            @foreach($errors->all() as $error)
            toastr.error('{{$error}}', Error, {
                CloseButton: true,
                ProgressBar: true
            });
            @endforeach
        </script>
    @endif

        @stack('script_2')

        <script>
            "user strict";
            (function ($) {
                $(document).ready(function () {

                    var owl = $(".feature-slider").owlCarousel({
                        loop: true,
                        margin: 10,
                        responsiveClass: true,
                        nav: false,
                        dots: false,
                        loop: false,
                        autoplay: true,
                        autoplayTimeout: 1500,
                        autoplayHoverPause: true,
                        rtl: {{$direction}},
                        responsive: {
                            0: {
                                items: 1.2,
                            },
                            500: {
                                items: 2,
                            },
                            768: {
                                items: 2.6,
                            },
                            992: {
                                items: 2.7,
                                margin: 30,
                            },
                            1200: {
                                items: 4,
                                margin: 30,
                            },
                        },
                    });

                    var sync1 = $("#sync1");
                    var sync2 = $("#sync2");
                    var thumbnailItemClass = ".owl-item";
                    var slides = sync1
                        .owlCarousel({
                            startPosition: 12,
                            items: 1,
                            loop: false,
                            margin: 0,
                            mouseDrag: false,
                            touchDrag: false,
                            pullDrag: false,
                            scrollPerPage: true,
                            autoplayHoverPause: false,
                            nav: false,
                            dots: false,
                            center: true,
                        })
                        .on("changed.owl.carousel", syncPosition);

                    function syncPosition(el) {
                        $owl_slider = $(this).data("owl.carousel");
                        var loop = $owl_slider.options.loop;

                        if (loop) {
                            var count = el.item.count - 1;
                            var current = Math.round(el.item.index - el.item.count / 2 - 0.5);
                            if (current < 0) {
                                current = count;
                            }
                            if (current > count) {
                                current = 0;
                            }
                        } else {
                            var current = el.item.index;
                        }

                        var owl_thumbnail = sync2.data("owl.carousel");
                        var itemClass = "." + owl_thumbnail.options.itemClass;

                        var thumbnailCurrentItem = sync2
                            .find(itemClass)
                            .removeClass("synced")
                            .eq(current);
                        thumbnailCurrentItem.addClass("synced");

                        if (!thumbnailCurrentItem.hasClass("active")) {
                            var duration = 500;
                            sync2.trigger("to.owl.carousel", [current, duration, true]);
                        }
                    }
                    var thumbs = sync2
                        .owlCarousel({
                            startPosition: 12,
                            items: 3,
                            loop: false,
                            margin: 10,
                            autoplay: false,
                            nav: false,
                            dots: false,
                            center: true,
                            mouseDrag: false,
                            touchDrag: false,
                            responsive: {
                                500: {
                                    items: 3,
                                },
                                768: {
                                    items: 5,
                                },
                            },
                            onInitialized: function (e) {
                                var thumbnailCurrentItem = $(e.target)
                                    .find(thumbnailItemClass)
                                    .eq(this._current);
                                thumbnailCurrentItem.addClass("synced");
                            },
                        })
                        .on("click", thumbnailItemClass, function (e) {
                            e.preventDefault();
                            var duration = 500;
                            var itemIndex = $(e.target).parents(thumbnailItemClass).index();
                            sync1.trigger("to.owl.carousel", [itemIndex, duration, true]);
                        })
                        .on("changed.owl.carousel", function (el) {
                            var number = el.item.index;
                            $owl_slider = sync1.data("owl.carousel");
                            $owl_slider.to(number, 500, true);
                        });
                    sync1.owlCarousel();

                    sync2.children().each(function (index) {
                        $(this).attr("data-position", index);
                    });

                    $(".owl-item:not(':first-child') .img").on("click", function () {
                        sync2.trigger("to.owl.carousel", [$(this).data("position")]);
                        $(".img").removeClass("trns");
                    });
                    $(".owl-item:first-child .img").on("click", function () {
                        sync1.trigger("prev.owl.carousel", [0]);
                        sync2.trigger("prev.owl.carousel", [0]);
                        sync1.trigger("prev.owl.carousel", [0]);
                        sync2.trigger("prev.owl.carousel", [0]);
                        $(".img").removeClass("trns");
                    });

                    // Go to the next item
                    $(".client-next").on("click", function () {
                        sync1.trigger("next.owl.carousel");
                        sync2.trigger("next.owl.carousel");
                        $(".img").addClass("trns");
                    });
                    // Go to the previous item
                    $(".client-prev").on("click", function () {
                        $(".img").addClass("trns");
                        sync1.trigger("prev.owl.carousel");
                        sync2.trigger("prev.owl.carousel");
                    });
                    $(".owl-prev").html('<i class="fas fa-angle-left">');
                    $(".owl-next").html('<i class="fas fa-angle-right">');
                });
            })(jQuery);


            const inputs = document.querySelectorAll('input[type="tel"]');
            inputs.forEach(input => {
                window.intlTelInput(input, {
                    initialCountry: "{{$countryCode}}",
                    utilsScript: "{{ dynamicAsset('public/assets/admin/intltelinput/js/utils.js') }}",
                    autoInsertDialCode: true,
                    nationalMode: false,
                    formatOnDisplay: false,
                    strictMode: true,
                    // allowDropdown: false,
                    @if (\App\Models\BusinessSetting::where('key', 'country_picker_status')->first()?->value  != 1)
                    onlyCountries: ["{{$countryCode}}"],
                    @endif
                });
            });


            function keepNumbersAndPlus(inputString) {
                let regex = /[0-9+]/g;
                let filteredString = inputString.match(regex);
            return filteredString ? filteredString.join('') : '';
            }

            $(document).on('keyup', 'input[type="tel"]', function () {
                $(this).val(keepNumbersAndPlus($(this).val()));
                });

        </script>


    </body>

    </html>
