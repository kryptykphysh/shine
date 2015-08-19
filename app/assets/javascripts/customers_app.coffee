app = angular.module('customers', [])

app.controller(
  'CustomerSearchController',
  [
    '$scope',
    '$http',
    ($scope, $http) ->
      page = 0
      $scope.customers = []

      $scope.search = (search_term) ->
        if search_term.length < 3
          return

        $http.get(
          '/customers.json',
          { params: { keywords: search_term, page: page } }
        ).success(
          (data, status, headers, config) ->
            $scope.customers = data
        ).error(
          (data, status, headers, config) ->
            alert('There was a problem: ' + status)
        )
        $scope.searched_for = search_term

      $scope.previousPage = ->
        if page > 0
          page = page - 1
          $scope.search($scope.keywords)

      $scope.nextPage = ->
        page = page + 1
        $scope.search($scope.keywords)
  ]
)
