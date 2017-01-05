<?php
require 'vendor/autoload.php';
use Aws\S3\S3Client;
try {
	$s3Client = S3Client::factory();
	$s3Client->createBucket(array(
		'Bucket'=>'YOUR_BUCKET_NAME_HERE'
	));
}
catch(\Aws\S3\Exception\S3Exception $e) {
	echo $e->getMessage();
}

echo "All Done";
