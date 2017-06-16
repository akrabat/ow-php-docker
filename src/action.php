<?php

require __DIR__ . '/../vendor/autoload.php';

use Ramsey\Uuid\Uuid;

function main(array $args = null) : array
{
    echo "Started my PHP Action\n";
    var_dump($args);

    $name = $args["name"] ?? "World";

    return [
        "greeting" => "Hello $name!",
        "Uuid" => Uuid::uuid4(),
        "time" => date("r"),
    ];
}
