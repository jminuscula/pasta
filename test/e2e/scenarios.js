'use strict';


describe('Pasta', function() {

    beforeEach(function() {
        browser().navigateTo('app/index.html');
    });

    it('should filter cards by tags input', function(){
        expect(repeater('.card').count()).toBe(1);

        input('TagQuery').enter('notfound');
        expect(repeater('.card').count()).toBe(0);

        input('TagQuery').enter('tag');
        expect(repeater('.card').count()).toBe(1);
    });

    it('should change ordering of the cards', function(){
        select('tagSort').option('pos');
        expect(repeater('.card').column('pos')).toBe([1, 2, 3]);
        select('tagSort').option('-date');
        expect(repeater('.card').column('pos')).toBe([3, 2, 1]);
    })

});
