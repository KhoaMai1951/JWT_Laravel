<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default filesystem disk that should be used
    | by the framework. The "local" disk, as well as a variety of cloud
    | based disks are available to your application. Just store away!
    |
    */

    'default' => env('FILESYSTEM_DRIVER', 'local'),

    /*
    |--------------------------------------------------------------------------
    | Default Cloud Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Many applications store files both locally and in the cloud. For this
    | reason, you may specify a default "cloud" driver here. This driver
    | will be bound as the Cloud disk implementation in the container.
    |
    */

    'cloud' => env('FILESYSTEM_CLOUD', 's3'),

    /*
    |--------------------------------------------------------------------------
    | Filesystem Disks
    |--------------------------------------------------------------------------
    |
    | Here you may configure as many filesystem "disks" as you wish, and you
    | may even configure multiple disks of the same driver. Defaults have
    | been setup for each driver as an example of the required options.
    |
    | Supported Drivers: "local", "ftp", "sftp", "s3"
    |
    */

    'disks' => [

        'local' => [
            'driver' => 'local',
            'root' => storage_path('app'),
        ],

        'public' => [
            'driver' => 'local',
            'root' => storage_path('app/public'),
            'url' => env('APP_URL').'/storage',
            'visibility' => 'public',
        ],

        's3' => [
//            'driver' => 's3',
//            'key' => env('AWS_ACCESS_KEY_ID'),
//            'secret' => env('AWS_SECRET_ACCESS_KEY'),
//            'region' => env('AWS_DEFAULT_REGION'),
//            'bucket' => env('AWS_BUCKET'),
//            'url' => env('AWS_URL'),
//            'endpoint' => env('AWS_ENDPOINT'),

//            'driver' => 's3',
//            'key' => 'AKIAY37FEZY4JJERW3P3',
//            'secret' => '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',
//            'region' => 'ap-southeast-1',
//            'bucket' => 'caycanhapi',
//            'url' => env('AWS_URL'),
//            'endpoint' => env('AWS_ENDPOINT'),

            'driver' => 's3',
            'key' => env('AWS_ACCESS_KEY_ID', 'AKIAY37FEZY4JJERW3P3'),
            'secret' => env('AWS_SECRET_ACCESS_KEY', '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'),
            'region' => env('AWS_DEFAULT_REGION', 'ap-southeast-1'),
            'bucket' => env('AWS_BUCKET', 'caycanhapi'),
            'url' => env('AWS_URL'), //You can keep this as is
            'endpoint' => env('AWS_ENDPOINT'), //You can keep this as is

        ],

    ],

];
