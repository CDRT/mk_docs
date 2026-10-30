// Binder behaviour: the active tab slides out on arrival, and hovering a
// contents entry pulls the tab for its part. Content never depends on this.
(function () {
  var root = document.documentElement;

  // The head sets is-arriving before first paint; release it after paint.
  if (root.classList.contains('is-arriving')) {
    requestAnimationFrame(function () {
      requestAnimationFrame(function () { root.classList.remove('is-arriving'); });
    });
  }

  var tabs = {};
  document.querySelectorAll('.tab[data-part]').forEach(function (t) { tabs[t.dataset.part] = t; });

  document.querySelectorAll('[data-pull]').forEach(function (el) {
    var tab = tabs[el.dataset.pull];
    if (!tab) return;
    var on = function () { tab.classList.add('is-pulled'); };
    var off = function () { tab.classList.remove('is-pulled'); };
    el.addEventListener('mouseenter', on);
    el.addEventListener('mouseleave', off);
    el.addEventListener('focusin', on);
    el.addEventListener('focusout', off);
  });
})();
