angular.module('CouchDB', ['ngResource']).
factory('couchdb', function($resource) {
    var Couch = $resource(
        ':protocol//:server/:db/_design/notes/_view/:view', {
            protocol: 'http:',
            server: 'pasta.local',
            db: 'pasta'
        }, {
            update: {
                method: 'PUT'
            }
        }
    );

    Couch.prototype.update = function(cb) {
        return Couch.update({q: this._id}, this, cb);
    };

    Couch.prototype.destroy = function(cb) {
        return Couch.remove({q: this._id, rev: this._rev}, cb);
    };

    return Couch;
});
