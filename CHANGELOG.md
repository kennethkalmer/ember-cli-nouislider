## master


* Don't call slider.set during dragging (#63 - @stephankaag)
* Added the padding option (#62 - @sonnyt)
* Upgrade ember-cli-sass and add sass to devDependencies
* Upgrade to ember-cli 3.12

## 1.1.0 2018-11-09

* Support closure actions because sendAction is deprecated (#68 - @scottkidder)

## 1.0.0 2018-04-28 - My First Decade on GitHub

* Remove deprecated `change` & `slide` properties
* Use nouislider's ability to just remove all event listeners, instead of tediously keeping track

## 1.0.0-rc.2 2018-04-14

* Add cssPrefix & cssClasses options (#57 - @stephankaag)

## 1.0.0-rc.1 2018-04-14

* Upgrade to Ember 3.0 (#53 - @tchak & #59 - @tchak)
* Bump to nouislider 11.0 (#53 - @tchak & #59 - @tchak)
* Move broccoli-funnel & broccoli-merge-trees to dependencies (from devDependencies)

## 0.14.1 2017-10-08

_Version bump only because I can't NPM properly_

## 0.14.0 2017-10-08

* Expose multitouch option (#47)
* Warn when component can't be initialized (#34)
* Bump to nouislider 10.1.0
* Bump to Ember 2.15.1


## 0.13.0 2017-03-12

* Bump to nouislider 9.2.0 (#44)

## 0.12.0 2017-02-27

* Fix deprecation warnings when rendering slider (#39 - @showy)
* Fix incorrect behaviour with negative ranges (reporting #24 @Ramblurr, fixed #43 @eraleis)
* Switch to using npm for nouislider (#44 - @bobisjan)

## 0.11.0 2016-16-16 - Happy Reconciliation Day

* Bump to Ember 2.10.0
* Updated docs example (#40 - @adambowles)
* Update slider if component properties have changed (#38 - @renebigot)

## 0.10.0 2016-10-03

* Bump to Ember 2.8.0 LTS
* BETA support for tooltips (#35 - michalsnik)
* Bump nouislider to 8.5.0
* Support for the 'disabled' attribute (#25 - @alexspeller)

## 0.9.1 2016-07-11

* Support for fastboot (#26 - @tschoartschi)
* Documentation update (#29 - @sandstrom)

## 0.9.0 2016-04-14

* Support for 'update', 'start' & 'end' events
* Bump nouislider to 8.3.0

## 0.8.1 2016-03-26

* Deprecate the old events ("change" & "slide") in favor of "on-change" & "on-slide"
* Fix regression introduced by `set` action, now called `on-set`

## 0.8.0 2016-03-26

* Bump nouislider to 8.0.2
* Added nodejs 4 & 5 to Travis config, allow failures on Node 5
* Upgrade ember-cli to 2.4.2
* Added "set" action in order to use it in acceptance testing (#22 - @juliankmazo)
* Include non-minified version of nouislider in development (#21 - @constantm)

## 0.7.0 2015-08-17

* Add CodeClimate badge to README
* Update ember-cli to 1.13.8, ember.js to 1.13.7
* Bring back 'format' (#19 - @knownasilya)
* Bring back 'snap' and 'pips' (#18 - @kbullaughey)

## 0.6.0 2015-07-09 - (Happy Birthday To Me)

* Add demoURL to package.json
* Use events instead of listeners (#14 - @knowasilya)
* Add "formats" & "pips" suppor (#13 - @davidgoli)

## 0.5.0 2015-07-02

* Upgrade to nouislider 8.0.1 (#10 - @blimmer)
* Documentation improvements (#10 - @blimmer)
* Toolchain upgrades and tlc (#10 - @blimmer)

Thanks Ben Limmer for doing all this work!

## 0.4.2 2015-07-02

* Pin nouislider dependency at 7.0.0 (#9 - @blimmer)

## 0.4.1 2015-06-19

* Fixed an issue with actions not being called correctly (#6)

## 0.4.0 2015-05-09

* Allow changing the name of the _change_ action
* Allow specifying an action for when sliding (#3)

## 0.3.0 2015-04-17

* Now works with prototype extensions disabled
* Moved addon bits into addons/ directory so they don't conflict with application
* Depend on ember-cli-htmlbars because we're shipping a template

## 0.2.0 2015-03-16

* Now observe changes to `start` and pass the changes on to noUiSlider
* Changed the default value of `start` to be `undefined`
* Changed the default value of `step` to be `undefined`
* Added missing `animate` attribute, default to `true`.

## 0.1.1 2015-03-09

* Moved rimraf dependency to devDependencies

## 0.1.0 2015-03-09

Initial release
