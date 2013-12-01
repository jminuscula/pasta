'use strict';


function CardListController($scope, couchdb){
    $scope.cards = [];
    couchdb.get({view: 'all'}, function(data){
        for (var i = 0; i < data.rows.length; i++){
            $scope.cards.push(data.rows[i].value);
        }
    });
    $scope.tagSort = 'pos';
};

angular.module('Pasta.controllers', ['CouchDB']).
    controller('CardListController', CardListController);
