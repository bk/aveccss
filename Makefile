all: dist \
	dist/avec.css \
	dist/avec.min.css \
	dist/avec-slim.css \
	dist/avec-slim.min.css \
	dist/avec-classless.css \
	dist/avec-classless.min.css \
	dist/avec.default-theme.css \
	dist/avec.selenized-theme.css \
	dist/avec.one-theme.css \
	dist/avec.pico-theme.css \
	dist/avec.gruvbox-theme.css \
	dist/avec.plain-theme.css

scss_files := $(wildcard scss/*.scss scss/*/*.scss scss/vars/*/*.scss)

theme_default := scss/default-theme.scss scss/vars/themes/_default.scss scss/base/_theme.scss
theme_selenized := scss/selenized-theme.scss scss/vars/themes/_selenized.scss scss/base/_theme.scss scss/base/theme-hooks/_selenized.scss
theme_one := scss/one-theme.scss scss/vars/themes/_one.scss scss/base/_theme.scss
theme_pico := scss/pico-theme.scss scss/vars/themes/_pico.scss scss/base/_theme.scss scss/base/theme-hooks/_pico.scss
theme_gruvbox := scss/gruvbox-theme.scss scss/vars/themes/_gruvbox.scss scss/base/_theme.scss
theme_plain := scss/plain-theme.scss scss/vars/themes/_plain.scss scss/base/_theme.scss scss/base/theme-hooks/_plain.scss

dist:
	mkdir -p dist

dist/avec.css: $(scss_files)
	sass --no-source-map scss/avec.scss dist/avec.css

dist/avec-slim.css: $(scss_files)
	sass --no-source-map scss/avec-slim.scss dist/avec-slim.css

dist/avec-classless.css: $(scss_files)
	sass --no-source-map scss/avec-classless.scss dist/avec-classless.css

dist/avec-slim.min.css: $(scss_files)
	sass --no-source-map scss/avec-slim.scss -s compressed dist/avec-slim.min.css

dist/avec-classless.min.css: $(scss_files)
	sass --no-source-map scss/avec-classless.scss -s compressed dist/avec-classless.min.css

dist/avec.min.css: $(scss_files)
	sass --source-map -s compressed scss/avec.scss dist/avec.min.css

dist/avec.default-theme.css: $(theme_default)
	sass --no-source-map scss/default-theme.scss dist/avec.default-theme.css

dist/avec.selenized-theme.css: $(theme_selenized)
	sass --no-source-map scss/selenized-theme.scss dist/avec.selenized-theme.css

dist/avec.one-theme.css: $(theme_one)
	sass --no-source-map scss/one-theme.scss dist/avec.one-theme.css

dist/avec.pico-theme.css: $(theme_pico)
	sass --no-source-map scss/pico-theme.scss dist/avec.pico-theme.css

dist/avec.gruvbox-theme.css: $(theme_gruvbox)
	sass --no-source-map scss/gruvbox-theme.scss dist/avec.gruvbox-theme.css

dist/avec.plain-theme.css: $(theme_plain)
	sass --no-source-map scss/plain-theme.scss dist/avec.plain-theme.css
