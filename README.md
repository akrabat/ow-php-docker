# OpenWhisk PHP Docker action with Composer dependency

This is an example of a simple OpenWhisk PHP action that has a Composer dependency that runs as a Docker action.

It creates a zip file that is uploaded to OpenWhisk which executes an `exec` bash script to install PHP and then
execute the PHP action.

The `src/action.php` must have a `main()` function with the following signature:

```php
    function main(array $args) : array
```

The `$args` contains the parameters passed to the action as an associative array and you must return an associative array which is then returned to the caller.

## Install

* Ensure you have set up OpenWhisk and have a working `wsk` command line client.
* Run `./build.sh {action_name}` to create the action and run it.

Example:

```text
)$ ./build.sh phpaction3
Updating dependencies
Creating Zip file
Updating OpenWhisk action 'phpaction3'
Invoking OpenWhisk action: wsk action invoke -br phpaction3 --param name Everyone
{
    "Uuid": "e4e00d64-edea-4a0e-87dd-c3f7bb1b1c75",
    "greeting": "Hello Everyone!",
    "time": "Fri, 16 Jun 2017 12:48:56 +0000"
}
```

## Run

To just run the action:

```text
wsk action invoke -br phpaction3 --param name Everyone
```


## License

For the avoidance of doubt, you may use this code however you like and do not need to attribute or include this notice. 

```text
Copyright 2017 Rob Allen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

[1]: https://github.com/apache/incubator-openwhisk/blob/master/docs/actions.md#creating-docker-actions
