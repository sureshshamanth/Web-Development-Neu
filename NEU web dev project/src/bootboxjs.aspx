<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>My page</title>
 
    <!-- CSS dependencies -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet">
    <!-- JS dependencies -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
 
    <p>Content here. <a class="alert" onclick="Confirmesponse()">Alert!</a></p>
 
    <!-- bootbox code -->
    <script src="js/bootbox.min.js"></script>
    <script>

        function Confirmesponse() {
            bootbox.confirm("Are you sure?", function (result) {
                if (result) {
                    alert("success!");
                }
                else {
                    alert("Fail!");
                }
            });
        };
    </script>
</body>
</html>