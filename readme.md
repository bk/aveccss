# AvecCSS

## Overview

AvecCSS is a lightweight CSS framework. It draws inspiration (and some CSS code) from three similar projects:

- [PicoCSS](https://picocss.com/) by Lucas Larroche.
- [PicnicCSS](https://picnicss.com/) by Francisco Presencia.
- [Simple.css](https://simplecss.org/) by Kev Quirk.

The main features of AvecCSS are the following:

- Built using SCSS for lightweight modularity and extensibility.
- Can be used to make plain, semantic, classless HTML look good without further changes.
- Offers a grid/column system to build complex layouts if needed.
- Responsive, with built-in facilities for easily adapting layouts to different screen widths.
- Has a few useful components (e.g. "hamburger" menu, tabboxes, admonitions, cards), none of which requires Javascript.
- Easily customizable even without touching the SCSS source; colors and some layout features are controlled with CSS variables.

## Themes

### Light and dark mode

AvecCSS supports automatically switching to dark mode if the user has set that OS/browser preference. Each color theme defines the colors for both light and dark mode.

The page author can also specify the mode explicitly using the `light-theme` or `dark-theme` CSS classes. This may apply to the whole page or to a section of it. For instance, you can use light mode for the main body of the page but dark mode for the header and footer like this:

```html
<html class="light-theme">
  <head>...</head>
  <body>
    <header class="dark-theme">...</header>
    <main>...</main>
    <footer class="dark-theme">...</footer>
  </body>
</html>
```

A more agnostic way of accomplishing much the same thing is to use the `reverse-theme` class. This switches to whichever color mode is not the default one for the page. In other words, if no theme is set and the user prefers dark mode, it will switch to light mode; and if `light-theme` has been applied to the `<html>` or `<body>` element or the user has no explicit preference, it will switch to dark mode.

```html
<html>
  <head>...</head>
  <body>
    <header class="reverse-theme">...</header>
    <main>...</main>
    <footer class="reverse-theme">...</footer>
  </body>
</html>
```

In this example, if the user prefers dark mode then the header and footer will be light while the main section will be dark. Otherwise, the header and footer will be dark and the rest of the page light.

### Color themes

A theme is implemented as a set of SCSS variables defining the colors to use in both light and dark mode. Aside from the default theme, the following five themes are available:

- Gruvbox - based on the [base16 version](https://github.com/dawikur/base16-gruvbox-scheme/) of this color schema.
- One - based on a [light](https://github.com/purpleKarrot/base16-one-light-scheme) and a [dark](https://github.com/LalitMaganti/base16-onedark-scheme) base16 implmentation of the One color schema.
- Pico (based on PicoCSS's default theme).
- Plain (A simple black-and-white theme).
- Selenized (similar to Solarized - based on the terminal terminal [color scheme](https://github.com/jan-warchol/selenized) by Jan Warchol.

The themes are exported to separate CSS files which can be loaded after the main AvecCSS file. For instance, in order to switch to Selenized, you would do this:

```html
<link rel="stylesheet" href="/css/avec.css">
<link rel="stylesheet" href="/css/avec.selenized-theme.css">
```

## Typography

### Body text

The user's base font size is left unchanged. For most people, it is 16px.

The font size for body text is set to 1.125rem by default, which accordingly means 18px in most cases.

The font size of most text elements is set in rems (if it its size is changed from the body text size at all).

Spacing units (margins and padding) are rem-based as well.

The theme determines if the default font is a serif or a sans-serif. The default theme sets the text font to serif but the font of headings to sans-serif. For more on themes, see later in this document.

### Headings

The sizes of headings are as follows by default:

- H1 is about 2.616rem or 42px (again, assuming a base font size of 16px).
- H2 is about 1.992rem or 32px.
- H3 is about 1.549rem or 25px.
- H4 is about 1.273rem or 20px.
- H5 is 1.125 rem or 18px.
- H6 is 1rem or 16px.

Headings can be grouped in `<hgroup>`, normally containing a heading and a subheading of a lower level (although other block elements, such as `<p>`, may also be used). This reduces the size of the subordinate heading and renders it in a muted color.

```html
<hgroup>
  <h2>The Roman Empire</h2>
  <h3>Its rise, decline and fall</h3>
</hgroup>
```

### Inline formatting

A link can be given a button-like appearance by setting an attribute, `role="button"`. This also works for some other elements such as `<label>`s.

Keyboard commands can be marked up using the `kbd` tag, e.g. `<kbd>Ctrl-K</kbd>`. They will then get an appearahce similar to a keyboard button.

### Images

`<img>` and `<video>` elements have a `max-width` of 100%.

The `<figcaption>` of a `<figure>` is shown centered below the image, in smaller type.

### Aside

An `<aside>` has a border, a discreet background and smaller text.

In breakpoint `sm` and above (and if it is inside either `<div>` or `<p>`) it also floats to the right and takes up 30% of the available space.

## Layout

### Breakpoints

Some of the layout features are dependent upon the defined breakpoints, which are the following:

- AvecCSS is mobile-first. Accordingly, there is no named breakpoint for mobile phones in portrait mode.
- `xs`: wide mobile or small tablet, 480px and up. Rarely used.
- `sm`: portrait tablet, 768px and up.
- `md`: landscape tablet or small laptop/desktop, 960px and up.
- `lg`: intermediate laptop/desktop, 1280px and up.
- `xl`: wide laptop/desktop, 1600px and up.

### Basics: `<main>` or `.container`

By default, block level elements immediately inside the `<body>` have a width of 55rem (normally equal to 880px) or 92%, whichever is smaller. This means that if you add AvecCSS to a random HTML document you are likely to at least get something readable.

To use AvecCSS properly, however, you should either have the document structure indicated in the code block above (with `<main>` inside `<body>`), or a `<div>` inside `<body>` with the CSS class `container`.

By default, the immediate children of the container follow the same rule, i.e. keep to a width of at most 55rem or 92%, whichever is smaller. You can add the following classes to the container to change this:

- `items-fluid`: Children keep to 92% regardless of screen width.
- `items-fixed`: Children keep to a fixed width for each breakpoint interval from `sm` to `lg` upwards. Below this the width is fluid. The widths are: 718px for `sm` and up, 910px for `md` and up, 1230px for `lg` and up.
- `items-max-md`: When added to `items-fluid` or `items-fixed`, sets the maximum width of each immediate child to the fixed width associated with `md`, i.e. 910px.
- `items-max-lg`: When added to `items-fluid`, sets the maximum width of each immediate child to the fixed with associated with `lg`, i.e. 1230px.
- `items-max-xl`: When added to `items-fixed`, expands the maximum width of children from 1230px to 1500px (which is the content width associated with the `xl` breakpoint). When added to `items-fluid`, sets the maximum width to 1500px.

A child element can always override the setting imposed by the container by specifying the following classes:

- `fluid`: The item takes up `92%` of the available space, regardless of screen width.
- `fixed`: The item has a fixed width for each breakpoint as indicated above.
- `full`: The item takes up all the available horizontal space, breaking out of the container ("full-bleed").
- `max-md`, `max-lg`, `max-xl`: Add this to `fixed` to specify a maximum width, or use it to override an `items-max-XX` setting in the container.
- `normal`: Behave as if the container had not specified any `items-*` class.

### Grids and columns

#### Grid

Give a containing element the class `grid` to make its children fill a grid where each of them takes up equal horizontal space. When that cannot be done without making each of them narrower than a certain minimum (120px by default), then the next item will wrap to the next line.


```html
<div class="grid">
  <div>item 1</div>
  <div>item 2</div>
  ...
</div>
```

Grids are normally for breakpoint `md` and up. You can use the class `grid-sm` for `sm` and up or `grid-xs` for all screen sizes. (The default minimum width below `sm` is 60px rather than 120px).

The items are separated by a column or row gap (normally 20px). You can get rid of this with the class `nogap`.

You can affect the minimum width of the children by adding classes to the grid container indicating the desired number of "columns" for each breakpoint:

- `c2` to `c12`: "I want this number of columns by default". (Below `sm` only `c2` to `c4` work; below `md` only `c2` to `c6` work. This assumes, of course, that `grid-xs` or `grid-sm` have been used).
- `cN-XX` where `N` is a number between 2 and 12 and `N` is a breakpoint name (`sm`, `md`, `lg` or `xl`): "I want this number of columns from this breakpoint and up". (When the breakpoint is `sm`, `N` cannot be above 6, and of course either `grid-xs` or `grid-sm` must have been used).

This should be 2 columns in mobile, 3 in `sm`, 4 in `md`, 5 in `lg` and 6 in `xl`:

```html
<div class="grid-xs c2 c3-sm c4-md c5-lg c6-xl">
  <div>item 1</div>
  <div>item 2</div>
  <div>item 3</div>
  <div>item 4</div>
  <div>item 5</div>
  <div>item 6</div>
  <div>item 7</div>
</div>
```

### Columns

Becausei items within each `grid` are always the same size it is not appropriate for defining layouts in the usual sense. The `cols` class, however, provides a more traditional 12-column based layout system.

By default, each item takes up all 12 columns, meaning that they each have to specify their own width as described below. This default can be changed by adding the following classes to the columns container:

- `col-twelfth`, `col-sixth`, `col-fourth`, `col-third`, `col-half`: The default width for each item becomes 1, 2, 3, 4 or 6 of the 12 columns available, respectively. Add `-sm`, `-md`, `-lg` or `xl` to these class names to apply the effect to that breakpoint and above.
- `no-gap`, `no-colgap`, `no-rowgap`: Get rid of the gaps between children. Add breakpoint names if desired to make this effect responsive.

The columns themselves, i.e. the immediate children of the column container can set the following classes to affect their own width and placement. Breakpoint names can be appended to each of these if desired (e.g. `cw6-sm`):

- `cw1` to `cw12` indicates the width of the item in columns.
- `cs1` to `cs12`: indicates at which column it should start.
- `cr2` to `cr6`: indicates how many rows this item should span. (Subsequent items appear beside it for the indicated number of rows provided they are not too wide or explicitly set to start at a conflicting column).
- `ord-1` to `ord-12`, as well as `ord-first`, `ord-last` and `ord-none`: Affects where this column items appears in the order of display. (In practice, `ord-none` would only be used in a responsive variant, in a context such as `ord-last ord-none-md`).

An example of a moderately complex layout implemented with these building blocks:

```html
<div class="full cols col-fourth">
  <div class="demo">cw3 by default</div>
  <div class="demo cw5">explicitly cw5</div>
  <div class="demo cw2">cw2</div>
  <div class="demo cw2">cw2</div>
  <div class="demo cw6 cr3">cw6 spanning 3 rows</div>
  <div class="demo">default</div>
  <div class="demo">default</div>
  <div class="demo cw6">cw6</div>
  <div class="demo cw12 ord-last">Full-width and moved to end using .ord-last</div>
  <div class="demo cs10">Jumping to col 10</div>
  <div class="demo cw10 cs2">10-wide, starting at col 2</div>
</div>
```

### Header, navigation, footer

#### Header

The main `<header>` (i.e. a `<header>` which is an immediate child of `<body>`) gets an accented background and a bottom-border.

#### Nav

A horizontal navigation bar, `<nav>`, is typically at the top of the header. The children of `<nav>` are spaced equally and the underlining of links is removed.

Here is a simple but not atypical `<nav>`:

```
<nav>
  <ul>
    <li><strong><a href="/"><strong>AvecCSS</a></strong></li>
  </ul>
  <ul>
    <li><a href="/products/">Products</a></li>
    <li><a href="/blog/">Blog</a></li>
    <li><a href="/mission/">Our mission</a></li>
  </ul>
</nav>
```

You would often have a "hamburger menu" at the top right of the main `<nav>`, at least in mobile and sometimes in all screen sizes. This is easily done using AvecCSS; see the section on the menu component later in this document.

#### Footer

The footer is full-width by default and separated from the body with a top border. It has a smaller font.

## Components

None of the components below require javascript. The interactive ones (main menu, modal windows, tabs) use hidden checkboxes or radio buttons as their basis for the CSS selectors. A couple of them (main menu and modal windows) may benefit from some javascript sugar, however – primarily for being able to dismiss them using the <kbd<Esc</kbd> key.

### Cards

Cards are represented using the `<article>` tag. They have a different background and a slight border shadow, making them appear slightly raised. They are best contained in `grid` or `cols` since they lose much of their visual impact if they grow too wide.

Cards can have a `<header>`, a `<footer>`, or both; these have an accented background. Images in the header are handled specially so as to reach the card border rather than respect its padding.

### Main/mobile menu component

The main menu must be inside a `<nav>` in order to function as intended.
Clicking on the menu symbol causes a menu to slide onto the page from the right, while the rest of the page is dimmed.

```html
<nav>
<div><a href="/">AvecCSS</a></div>
<div>
  <input id="main-menu-demo" type="checkbox" class="show-menu">
  <label for="main-menu-demo" class="burger pr-1">
    <span class="menu-icon"></span>
  </label>
  <div class="menu has-close">
    <label for="main-menu-demo" class="close">&times;</label>
    <h4>Menu</h4>
    <ul>
    <li><a href="#">Frontpage</a></li>
    <li><a href="#">Tempora velit</a></li>
    <li><a href="#">Illa laborum ipsa</a></li>
    <li><a href="#">Eaque voluptates</a></li>
    </ul>
  </div>
</div>
</nav>
```

This menu widget is not responsive by itself. In order to distinguish between the menu available to mobile visitors and the navigation seen by those with larger screens, you can use the visibility utility classes described later (`seen-*` and its companions).

### Modal window

A modal (or lightbox) is kind of popup window appearing seemingly atop the page, with the rest of the page overlaid with a dark, semitransparent layer. It looks like a card (since, like a card, it uses the `<article>` tag).


```html
<label for="modal1" role="button" class="d-inl">Show modal</label>

<div class="modal">
  <input id="modal1" type="checkbox" />
  <label for="modal1" class="overlay"></label>
  <article>
    <header>
      <label for="modal1" class="close">&times;</label>
      <h4>Terrific modal</h4>
    </header>
    <p>Corrupti numquam vitae ut omnis dicta nemo ipsa sunt...</p>
    <p>Architecto sint veritatis soluta asperiores eos ex minus...</p>
    <footer>
      <div class="grid">
        <a role="button" href="#">Buy now!</a>
        <label for="modal1" role="button" class="bg-error">Cancel</label>
      </div>
    </footer>
  </article>
</div>
```

## Tabs

A tab box can have up to eight tabs. The structure is rather strict. Inside a wrapper with the `tabs` class, there is first at the front a series of radio button elements and labels representing the tabs (they must be arranged as pairs with the radio button immediately in front of its label). After that the tab panes themselves follow; they must have a `pane` class and appear in the same order as the corresponding tabs. One of the tabs must be `checked`.

```html
<div class="tabs">
  <input type="radio" name="tabgroup" id="tab1" checked>
  <label for="tab1">Animi</label>
  <input type="radio" name="tabgroup" id="tab2">
  <label for="tab2">Perspiciatis</label>
  <input type="radio" name="tabgroup" id="tab3">
  <label for="tab3">Voluptas</label>
  <div class="pane"><p>Tab pane 1. Dignissimos ullam architecto beatae...</p></div>
  <div class="pane"><p>Tab pane 2. Aut et non pariatur doloremque officiis...</p></div>
  <div class="pane"><p>Tab pane 3.  Quisquam aut officiis sequi nostrum...</div>
</div>
```

## Hero image

A hero image is a large (often full-screen) dark background image with text on top, appearing at the top of the page or near it.

There is not much to a hero image. Give a `<div>` or other block element the `hero` class. You must set the background image on that div yourself in a stylesheet or via the `style` attribute. If the image is not dark enough, you can add a dark gradient to the background as well, like so:

```css
background-image:
    linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
    url(/img/my-hero-image.jpg);
```

By default the size of the hero div depends on the content, although it has a minimum height of 400px. The following classes modify how the hero block behaves:

- `full-height`: Ensure a height of at least the screen height.
- `half-height`: Ensure a height of at least half the screen height.
- `center-content`: The text in the hero block will be centered both vertically and horizontally.

As a rule, the text on top of the hero div should be light in color. You must see to this yourself. The `dark-theme` class may be helpful, as well as such utility classes as `text-brigt`

If the hero image is inside `<main>` or a `.container`, you should add the `full` class to the block to ensure that it covers the full screen width.

### Admonition

An admonition is a message or reminder in the text of the page to alert the reader to something. It can contain a tip, a warning or other content. There are four types of admonitions, distinguished by their colors:

- info: blue
- warning: orange
- danger: red
- success: green

The structure of an admonition is as follows:

```html
<div class="admonition info">
  <p class="admonition-title">Info</p>
  <p>This is an informational message ...</p>
  <p>(Any number of paragraphs may follow here...)</p>
</div>
```

An informational message is the default, so formally the type class `info` can be omitted.

A warning message has the class `caution` or `warning`. An error message has the class `error` or `danger`, and a success message the class `success`.

### Stack

<div class="cols">
<div class="cw8-sm">
A stack is a collection of elements of the same type, stacked on top of each other with the margins between them removed. It is intended for grouping elements with a visible background, such as buttons, as in this example. (See also below for an example with an accordion).

```html
<div class="stack">
  <button id="b1">First button</button>
  <button id="b2">Second button</button>
  <button id="b3">Third button</button>
</div>
```

### Accordion

An accordion is just a `<details>` tag with slight variations from the default brower rendering. You can combine several of them into a unit by giving them a wrapper with the `stack` class.

```html
<div class="stack">
<details>
  <summary>Windows system requirements</summary>
  <p>Recusandae quibusdam aut est quasi illum beatae ...</p>
</details>
<details>
  <summary>Mac system requirements</summary>
  <p>Labore occaecati deserunt non sunt amet ex aperiam ...</p>
</details>
<details>
  <summary>Linux system requirements</summary>
  <p>Dolorem et totam deserunt ut quia. Commodi nam illo ...</p>
</details>
</div>
```

### Dropdown

Dropdowns are also implemented as `<details>` but with a bit more special styling and with stricter requirements on the contents. The `<details>` must have `role="dropdown"` and the immediate children must be a `<summary>` and an `<ul>`, in that order. The appearance is somewhat similar to a `<select>`.


```html
<details role="dropdown">
  <summary>Fruit dropdown</summary>
  <ul>
    <li><a href="#">Apple</a></li>
    <li><a href="#">Orange</a></li>
    ...
  </ul>
</details>
```

A dropdown placed in a Nav looks a bit different - more like a link and with tighter spacing.

A dropdown can be made to look like a button by adding `role="button"` to the `<summary>` tag. If desired, the background color of the button can then be modified by adding a class attributes (e.g. `<summary role="dropdown" class="bg-error">`).

The list shown by the dropdown is normally placed so that its left side aligns with the left side of the `<summary>`. You can change this to the right side by adding `class="rightset"` to the `<ul>`. (The difference between the two is not visible unless the list is broader than the dropdown button, since the minimum width is the same as the button).


## Utility classes

### Spacing

Margins and spacing are indicated with classnames following the pattern `<prefix><direction>-<unit>`, where `<prefix>` is either `m` for margin or `p` for padding, `direction` is either empty or one of `t`, `r`, `b` or `l` (for top, right, bottom and left, respectively); whereas `<unit>` is either a number between 0 and 5, the word `half`, or `a` for `auto` (`a` is for `m` only).

The numbers (as well as `half`) indicate how many spacing units to apply. By default, the spacing unit is 0.625rem (i.e. 10px).

For instance, `ml-a mr-a mb-2 p-half` means horizontal centering, a bottom margin of 20px and a padding of 5px (unless the base font size or the `--spacing` css variable have been changed).

There is currently no support for responsive spacing (i.e. spacing for specific screen widths).

### Visibility

A collection of classes with the pattern `seen-<m><s><d>` where `<m>`, `<s>` and `<d>` are either 1 (for visible) or 0 (for invisible) control in which breakpoints the element with the class can be seen. The breakpoints are the following: `<m>` is mobile (i.e. the `xs` and below), `<s>` is tablet and small desktop, i.e. the `sm` and `md` breakpoint range, and `<d>` is `lg` and up. For instance, `seen-100` means that the element with this class should only be visible in mobile.

If you use a `seen-*` class on an inline element you must add the `inl` class as well so as to indicate that it is inline. Similarly, if you use it on a table, you need to add the `tbl` class as well.

The class `hidden` is an alias for `seen-000`, and `shown` is an alias for `seen-111`.

You can also hide something in a specific brekapoint range with `hidden-md`, `hidden-sm`, `hidden-lg` and `hidden-lg`. These can be combined with `seen-*` in order to make an element visible only at a specific breakpoint as follows:

- mobile only (anything below `sm`) = `seen-100`
- sm-only = `seen-010 hidden-md`
- md-only = `seen-010 hidden-sm`
- lg-only = `seen-001 hidden-xl`
- xl-only = `seen-001 hidden-lg`

### Border and border-radius

A class following the pattern `b<direction>-<amount>` affects the borders of the element to which it is applied. Here `<direction>` is either `t`, `r`, `b`, or `l` (for each of the four sides), or `a` (for all sides); whereas `<amount>` is either 0, 1, 2 or 4, which indicates the number of pixels.

The class `borad` applies the border-radius in the `--border-radius` CSS variable (5px by default).

The class `borad-0` sets the border-radius to 0.

The class `borad-round` applies a border-radius of 50%, making square elements look circular.

### Width

The width of an element can be set with a class following the pattern `w<amount>`, where `<amount>` is one of 0, 10, 20, 25, 33, 40, 50, or 100. These numbers stand for the percentage of the available space. (Here, 33 actually means 33.333333%, but the other percentages are exact).

The widths can be made responsive by appending a breakpoint postfix. For instance, `w100 w50-sm w33-lg` means 100% width in mobile, 50% width in tablet and small desktop and 1/3 width in normal desktops/laptops.

### Fonts

#### Font family

The classes `sans`, `serif` and `mono` set the font-family for their targets to the configured values of the CSS variables `--sans-font`, `--serif-font` and `--mono-font`, respectively.

#### Font size

The classes `larger` and `smaller` apply the relative font size keywords `larger` and `smaller` to the given element and its descendants. The effect may differ slightly between browsers. Commonly `smaller` means 83.33% and `larger` 120% of the base font size.

### Color and background

Foreground or text color can be set with the following classes: `text-vivid`, `text-accent`, `text-muted`, `text-reverse`, `text-success`, `text-warning`, `text-error`, `text-info`, `text-normal`.

Background color can be set with the following classes: `bg-accent`, `bg-contrast`, `bg-marked`, `bg-reverse`, `bg-success`, `bg-warning`, `bg-error`, `bg-info`, `bg-normal`.

The colors which are applied are from the active theme. They are registered in CSS variables which mostly have names similar to the class names.

### Alignment

The classes `ta-l`, `ta-r` and `ta-c` set text-align to left, right or center, respectively.

Th classes `fl-r` and `fl-r` apply `float: right` and `float: left`, respectively. To this you may add `cl-r` or `cl-l` for `clear: right` and `clear: left`, respectively. The parent of a floated child may benefit from the `clearfix` class.

### X-scroll

Add the class `x-scroll` to a wrapper to allow content inside the wrapper to scroll horizontally if needed. This is mainly useful for large tables so as to make them accessible in mobile: `<div class="x-scroll"><table>...</table></div>`.


## CSS variables

The following CSS variables are defined by AvecCSS:

### Colors

These variables are defined by the theme. Their specific value depends on whether the light or the dark variety of the theme is active.

- `--accent`: Accent color, used for links.
- `--accent-bg`: Accent background.
- `--bg`: Main background color.
- `--box-shadow`: Box shadow setting (for cards).
- `--border`: Border color.
- `--button-text`: Color of text in buttons.
- `--card-bg`: Background of cards.
- `--code`: Text color for inline `<code>` elements.
- `--code-bg`: Background for inline `<code>` elements.
- `--contrast-bg`: Alternative accent background, contrasting more clearly with `--bg`.
- `--disabled`: Color for disabled buttons.
- `--error`: Color for admonition of type `error`; generally red.
- `--info`: Color for admonition of type `info`; generally blue.
- `--marked`: Background for `<mark>` elements.
- `--mark-text`: Text color for `<mark>` elements.
- `--preformatted`: Background for code blocks.
- `--success`: Color for admonition of type `success`; generally green.
- `--text`: Main text color.
- `--text-heading`: Color for headings.
- `--text-light`: Muted text color.
- `--text-vivid`: Color for vivid text; lighter text in dark themes and darker in light themes.
- `--warning`:  Color for admonition of type `warning`; generally orange.

Themes may in some cases also affect the font settings, but those variables are listed below rather than here.

### Breakpoints

- `--bp-xs`: 480px; wide mobile phone or small tablet above this point, ordinary mobile below it.
- `--bp-sm`: 768px; tablet in portrait mode.
- `--bp-md`: 960px; tablet in landscape mode or small laptop/desktop.
- `--bp-lg`: 1280px; laptop/desktop.
- `--bp-xl`: 1600px; laptop/desktop with large screen.

!!! danger "Read-only breakpoints"
    `@media` queries cannot be based on CSS variables, so these values are **for reference only**. If they are changed after loading the stylesheet, it will probably have unfortunate side effects, as some calculations are based upon them.

### Font settings

The basic font families are in the following variables

- `--mono-font`: Monospaced typeface.
- `--sans-font`: Sans-serif typeface.
- `--serif-font`: Serif typeface.
- `--main-font`: The main body text font; generally identical to either `--sans-font` or `--serif-font`.

The heading typeface may or may not be different from the `--main-font`:

- `--heading-font`: Typeface for headings. Generally the same as `--sans-font`.
- `--heading-weight`: The font-weight for headings. The default is `bold`.

There are several variables for font size:

- `--font-size`: Base size of body text.
- `--h1-size`: Size for H1 headings.
- `--h2-size`: Size for H2 headings.
- `--h3-size`: Size for H3 headings.
- `--h4-size`: Size for H4 headings.
- `--h5-size`: Size for H5 headings.
- `--h6-size`: Size for H6 headings.

### Layout

- `--container-fixed-margin`: Minimum margin for content in main/container in `fixed` mode. The default is 25px.
- `--container-width`: The width for content in main/container in normal mode (when there is room). The default is 54rem.
- `--container-max-width`: Maximum width for content in main/container in normal or `fluid` mode. The default is 92%.

### Grid/column

- `--column-gap`: Gap between columns in a grid or column container; 2 × `--spacing` by default (i.e. 20px in most cases).
- `--row-gap`: Gap between rows in a grid or column conainer; 2 × `--spacing` by default (i.e. 20px in most cases).
- `--grid-min-col-width`: Minimum width of items in a grid; set by default to 60px in mobile and 120px otherwise.

### Other

- `--spacing`: The basic spacing unit, affecting most of the padding and margin settings, as well as few others. Set to 0.625rem by default, which corresponds to 10px for most people.
- `--border-radius`: The border-radius for rounded corners. This is set to half of `--spacing` by default, i.e. generally 5px.

## Customizing AvecCSS

- A lot of customization can be done by modifying the CSS variables used by AvecCSS.

- You can modify the CSS classes and rules in AvecCSS by overriding them in your own CSS file.

- Similarly, if you want to create your own color theme theme without touching SCSS, it is quite easy to modify one of the theme files from `dist/` and save it under a new name.

- If you need to customize AvecCSS beyond this, the best way is to clone the project and change the SCSS source.

## License

[MIT](https://opensource.org/licenses/MIT)

## Author

[Baldur Kristinsson](https://github.com/bk)
