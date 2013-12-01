'use strict';


describe('Pasta controllers', function(){

    beforeEach(module('Pasta.controllers'));

    var scope, ctrl;

    it('should create a non empty Card model', inject(function($controller){
        scope = {};
        ctrl = $controller('CardListController', {$scope: scope});
        expect(scope.cards.length).toBeGreaterThan(0);
    }));

    it('should set the default order as manual', inject(function(){
        expect(scope.tagSort).toBe('pos');
    }));

});
