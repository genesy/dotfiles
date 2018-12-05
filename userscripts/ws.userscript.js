var dyn = $(".ember-power-select-trigger").find('.ember-power-select-selected-item').text().replace(/\s|\t/g,'');

function addGlobalStyle(css) {
    var head, style;
    head = document.getElementsByTagName('head')[0];
    if (!head) { return; }
    style = document.createElement('style');
    style.type = 'text/css';
    style.innerHTML = css;
    head.appendChild(style);
}

addGlobalStyle('#application { max-width: 1200px; margin: 0 auto }');
function filterServicesWithDyn(dyn) {
  $('.stack-section table tbody tr').map((i,el) => {
    var hasMatch = $(el).find('.service-detail').text().indexOf(dyn.toUpperCase()) !== -1;
    if (!hasMatch) {
      $(el).hide();
    }
  })
}

function filterServicesWithoutMaster() {
  $('.stack-section table tbody tr').map((i,el) => {
    var t = $(el).find('.service-detail').text()
    var hasMatch = t.indexOf('stelladotops') !== -1 && (t.indexOf('master') === -1);
    if (!hasMatch) {
      $(el).hide();
    }
  })
}

unsafeWindow.auto = function() {
  var dyn = $(".ember-power-select-trigger").find('.ember-power-select-selected-item').text().replace(/\s|\t/g,'');
  filterServicesWithDyn(dyn);
}

var cb = (mutationsList, observer) => {
  for (var mutation of mutationsList) {
    if (mutation.target.classList.contains('ember-basic-dropdown-trigger')) {
      unsafeWindow.auto();
    }
  }
}

var observer = new MutationObserver(cb);
observer.observe(document.body, {
  attributes: true,
  childList: true,
  subtree: true
})