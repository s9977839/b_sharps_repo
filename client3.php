<html>
<head>
<title>Angular</title>
</head>
<body>
    <div ng-app="" ng-controller="studentController">
        <p>
            <table class="tbl" ng-show="tblshow">
                <tr>
                    <th>ID</th>
                    <th>C_ID</th>
                    <th>Title</th>
                </tr>
                <tr ng-repeat="x in dbValue">
                    <td><span ng-bind="x.id"></span> </td>
                    <td><span ng-bind="x.c_id"></span> </td>
                    <td><span ng-bind="x.title"></span> </td>
                </tr>
            </table>
        </p>
        <p>
        <input type="button" ng-click="changeValues()" value="Get from DB" ng-show="!tblshow" /></p>
    </div>
    <script src="angular.js"></script>
    <script>
        function studentController($scope,$http) {
            $scope.tblshow = false;
            $scope.changeValues = function (){
                $scope.tblshow = true;
                $http.get("api3.php").success(
                function(response) {
                    $scope.dbValue = response;
                });
            }
        }
    </script>
    <style>
        .tbl{
            border:1px solid #ccc;
            border-collapse:collapse;
        }
        .tbl th,td{
            padding:5px;
            border:1px solid #ccc;
            border-collapse:collapse;
        }
    </style>
</body>
</html>

