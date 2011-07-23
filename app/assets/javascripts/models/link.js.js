(function() {
  var Link;
  Link = Backbone.model.extend({
    initialize: function(attributes) {
      var title;
      title = attributes.title;
      if (title.length > 60) {
        attributes.title = title.slice(0, 57) + '...';
      }
      return this.set(attributes);
    },
    url: function() {}
  });
}).call(this);
